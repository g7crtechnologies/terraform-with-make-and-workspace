module "vm" {
  source                         = "../modules/tfs_azurerm_compute"
  instance_config                = var.instance_config
  principal_id                   = var.principal_id
  backend_id                     = module.lb_rule.backend_id
  frontend_ip_configuration_name = module.lb_rule.frontend_ip_configuration_name
}
module "lb_rule" {
  source   = "../modules/tfs_azurerm_lbrules"
  location = var.location
  LbRules  = var.LbRules
  prefix   = var.prefix
  nic_name = null
  nic_rg   = null
  lb_name  = var.lb_creation == true ? tostring(element(module.lb[0].lb_fip_name, 0)) : var.lb_name
  depends_on = [
    module.lb
  ]
}
module "lb" {
  count    = var.lb_creation == true ? 1 : 0
  source   = "../modules/tfs_azurerm_lb"
  lbs      = var.lbs
  sku      = var.sku
  location = var.location
  prefix   = var.prefix
  tags     = var.tags
}
