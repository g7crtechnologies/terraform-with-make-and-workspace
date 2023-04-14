#Module for Express Route 
module "ExpressRoute" {
  source                = "../../module/tfs_azurerm_er"
  location              = var.location
  public_ip_sku         = var.public_ip_sku
  pip_allocation_method = var.pip_allocation_method
  authorization_name    = var.authorization_name
  vng_config            = var.vng_config
  sku                   = var.sku
  con_config            = var.con_config
  er_config             = var.er_config
  gateway_subnet        = var.gateway_subnet
  tags                  = var.tags
}

