#Local Variable and accepting remote state data.

locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  vnet_name           = module.hub.vnet_name
  public_ip_map       = { for pip in var.public_ip_names : pip => true }
}

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

#---------------------------------------------------------
# Firewall Subnet Creation or selection
#----------------------------------------------------------
resource "azurerm_subnet" "fw-snet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.vnet_name
  address_prefixes     = var.firewall_subnet
}


#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  name                = "tfs-nsg-${terraform.workspace}-${local.loc_prefix}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.fw-snet
  ]
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.fw-snet.id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.fw-snet
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
    azurerm_subnet.fw-snet
  ]
  tags = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt" {
  route_table_id = azurerm_route_table.route_table.id
  subnet_id      = azurerm_subnet.fw-snet.id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.fw-snet
  ]
}

#------------------------------------------
# Public IP resources for Azure Firewall
#------------------------------------------

resource "azurerm_public_ip" "fw-pip" {
  for_each            = local.public_ip_map
  name                = lower("tfs-pip-${var.firewall_config.name}-${each.key}-${local.loc_prefix}")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags[terraform.workspace]
}

resource "azurerm_public_ip" "fw-mgnt-pip" {
  count               = var.enable_forced_tunneling ? 1 : 0
  name                = lower("tfs-pip-${var.firewall_config.name}-fw-mgnt")
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags[terraform.workspace]
}

#-----------------
# Azure Firewall 
#-----------------
resource "azurerm_firewall" "fw" {
  name                = format("%s", "tfs-fw-${var.firewall_config.name}-${local.loc_prefix}")
  resource_group_name = local.resource_group_name
  location            = local.location
  sku_name            = var.firewall_config.sku_name
  sku_tier            = var.firewall_config.sku_tier
  tags                = var.tags[terraform.workspace]
  firewall_policy_id  = azurerm_firewall_policy.firewall_policy.id

  dynamic "ip_configuration" {
    for_each = local.public_ip_map
    iterator = ip
    content {
      name                 = ip.key
      subnet_id            = ip.key == var.public_ip_names[0] ? azurerm_subnet.fw-snet.id : null
      public_ip_address_id = azurerm_public_ip.fw-pip[ip.key].id
    }
  }
  depends_on = [
    azurerm_firewall_policy.firewall_policy
  ]
}

resource "azurerm_firewall_policy" "firewall_policy" {
  name                     = "tfs-fw-po-${var.firewall_policy.name}-${local.loc_prefix}"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  threat_intelligence_mode = var.firewall_policy.threat_intelligence_mode
  sku                      = var.firewall_policy.sku_tier

}
