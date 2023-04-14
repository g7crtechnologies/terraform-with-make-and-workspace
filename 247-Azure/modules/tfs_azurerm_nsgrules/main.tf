#------------------------------------------------------------
# Local configuration - Default (required). 
#------------------------------------------------------------

locals {
  resource_group_name = module.rg.rg_name
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  location            = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

#---------------------------------------------------------
# NSG Creation with NSG-Rules
#----------------------------------------------------------

resource "azurerm_network_security_rule" "infra" {
  for_each                     = var.nsg_rule
  name                         = each.value["name"]
  priority                     = each.value["priority"]
  direction                    = each.value["direction"]
  access                       = each.value["access"]
  protocol                     = each.value["protocol"]
  source_port_range            = each.value["source_port_range"]
  destination_port_range       = each.value["destination_port_range"]
  destination_port_ranges      = each.value["destination_port_ranges"]
  source_address_prefix        = each.value["source_address_prefix"]
  source_address_prefixes      = each.value["source_address_prefixes"]
  destination_address_prefix   = each.value["destination_address_prefix"]
  destination_address_prefixes = each.value["destination_address_prefixes"]
  resource_group_name          = local.resource_group_name
  network_security_group_name  = var.nsg
  description                  = each.value["description"]
}
