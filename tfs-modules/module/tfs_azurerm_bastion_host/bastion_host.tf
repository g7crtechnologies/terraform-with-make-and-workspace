#------------------------------------------
# Local variables
#------------------------------------------

locals {
  location            = var.location
  resource_group_name = module.rg.rg_name
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  vnet_name           = module.hub.vnet_name
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location

}

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

# Create a subnet for Bastion Host // DO NOT Rename
resource "azurerm_subnet" "bastion-subnet" {
  name                 = "AzureBastionSubnet"
  address_prefixes     = var.subnet_cidr
  virtual_network_name = local.vnet_name
  resource_group_name  = local.resource_group_name
}

# Create a Public IP for the Bastion Host
resource "azurerm_public_ip" "bastion" {
  name                = "tfs-pip-${terraform.workspace}-${local.loc_prefix}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = var.tags[terraform.workspace]
}

# Create the Bastion Host Service
resource "azurerm_bastion_host" "bastion" {
  name                = "tfs-bh-${terraform.workspace}-${local.loc_prefix}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  sku                 = var.sku
  scale_units         = var.scale_units

  ip_configuration {
    name                 = "tfs-bh-ipcfg-${terraform.workspace}-${local.loc_prefix}-speech"
    subnet_id            = azurerm_subnet.bastion-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion.id
  }
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  name                = "tfs-nsg-${terraform.workspace}-${local.loc_prefix}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.bastion-subnet
  ]
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.bastion-subnet.id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.bastion-subnet
  ]
}
#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table" {
  name                = "tfs-rt-${terraform.workspace}-${local.loc_prefix}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.bastion-subnet
  ]
  tags = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt" {
  route_table_id = azurerm_route_table.route_table.id
  subnet_id      = azurerm_subnet.bastion-subnet.id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.bastion-subnet
  ]
}