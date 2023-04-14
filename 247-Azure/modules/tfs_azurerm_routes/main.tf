locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

resource "azurerm_route" "routes" {
  for_each               = var.routes[terraform.workspace]
  name                   = each.value.name
  resource_group_name    = local.resource_group_name
  route_table_name       = each.value.route_table_name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}
