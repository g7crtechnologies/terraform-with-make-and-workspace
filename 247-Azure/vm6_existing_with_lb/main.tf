module "lb_rule" {
  source   = "../modules/tfs_azurerm_lbrules"
  location = var.location
  LbRules  = var.LbRules
  prefix   = var.prefix
  lb_name  = var.lb_creation == true ? tostring(element(module.lb[0].lb_fip_name, 0)) : var.lb_name
  nic_name = var.nic_name
  nic_rg   = var.nic_rg
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
