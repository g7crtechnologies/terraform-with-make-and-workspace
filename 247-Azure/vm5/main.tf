module "vm" {
  source                         = "../modules/tfs_azurerm_compute"
  instance_config                = var.instance_config
  principal_id                   = var.principal_id
  backend_id                     = var.enable_lb == true ? module.lb.backend_id : []
  frontend_ip_configuration_name = var.enable_lb == true ? module.lb.frontend_ip_configuration_name : []
  enable_lb                      = var.enable_lb
}
module "lb" {
  count    = var.enable_lb == true ? 1 : 0
  source   = "../modules/tfs_azurerm_lbrules"
  location = var.location
  LbRules  = var.LbRules
  prefix   = var.prefix
  lb_name  = var.lb_name
  nic_name = null
  nic_rg   = null
}
