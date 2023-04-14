#------------------------------------------
# Module for Vnet
#------------------------------------------
module "vnet" {
  source = "../../module/tfs_azurerm_vnet"
  # subscription_id = var.subscription_id
  address_space                 = var.address_space
  region                        = var.region
  tags                          = var.tags
  subnet_prefixes               = var.subnet_prefixes
  location                      = var.location
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
}
