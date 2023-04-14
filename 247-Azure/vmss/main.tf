module "vmss" {
  source           = "../modules/tfs_azurerm_vmss"
  vmss_instances   = var.vmss_instances
  location         = var.location
  ssh_key_name     = var.ssh_key_name
  ssh_key_rg_name  = var.ssh_key_rg_name
  subnet_name      = var.subnet_name
  subnet_rg_name   = var.subnet_rg_name
  subnet_vnet_name = var.subnet_vnet_name
  gallery_name     = var.gallery_name
  image_name       = var.image_name
  image_rg         = var.image_rg
  image_version    = var.image_version
  instance_config  = var.instance_config
  backend_id       = module.lb_rule.backend_id

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
