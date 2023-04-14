#------------------------------------------
# Local variables
#------------------------------------------
module "truth" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}
locals {
  resource_group_name = module.truth.rg_name
  location            = var.location
  vnet_id             = values(azurerm_virtual_network.vnet)[*].id
  vnet_name           = values(azurerm_virtual_network.vnet)[*].name
  subnet_id           = values(azurerm_subnet.subnet)[*].id
}
#------------------------------------------
# Virtual Networks
#------------------------------------------

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.address_space[terraform.workspace]
  name                = "tfs-vnet-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = each.value["address_space"]
  tags                = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets
#------------------------------------------

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_prefixes[terraform.workspace]
  address_prefixes     = each.value["address_prefixes"]
  name                 = "tfs-snet-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.value.skey].name
  service_endpoints    = each.value["service_endpoints"]
}
#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.subnet_prefixes[terraform.workspace]
  name                = "tfs-nsg-${each.value["skey"]}-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.subnet
  ]
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  for_each                  = var.subnet_prefixes[terraform.workspace]
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.subnet
  ]
}
#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table" {
  for_each                      = var.address_space[terraform.workspace]
  name                          = "tfs-rt-${each.value["name"]}-${var.region}-${each.value["product"]}"
  resource_group_name           = local.resource_group_name
  location                      = local.location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  depends_on = [
    azurerm_subnet.subnet
  ]
  tags = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt" {
  for_each       = var.subnet_prefixes[terraform.workspace]
  route_table_id = azurerm_route_table.route_table[each.value.skey].id
  subnet_id      = azurerm_subnet.subnet[each.key].id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.subnet
  ]
}
