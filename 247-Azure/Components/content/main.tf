module "vm" {
  source                         = "../../modules/tfs_azurerm_compute"
  instance_config                = var.instance_config
  principal_id                   = var.principal_id
  backend_id                     = var.enable_lb == true ? module.lb_rule.backend_id : []
  frontend_ip_configuration_name = var.enable_lb == true ? module.lb_rule.frontend_ip_configuration_name : []
  enable_lb                      = var.enable_lb
  subnet_id                      = module.vnet.c2c_app
  mount_list                     = var.mount_list
  enable_pip                     = false
  pip_count                      = var.pip_count
  increase_nic                   = false
  nic_id                         = ""
  fileshare_name = ["//tfsspeechdeveast.file.core.windows.net/content-audio" , "//tfsspeechdeveast.file.core.windows.net/content-static" , "//tfsspeechdeveast.file.core.windows.net/audio-darbot" , "//tfsspeechdeveast.file.core.windows.net/vcontent-private" , "//tfsspeechdeveast.file.core.windows.net/content-feeds" , "//tfsspeechdeveast.file.core.windows.net/content-emdata"]
}

module "lb" {
  count    = var.lb_creation == true ? 1 : 0
  source   = "../../modules/tfs_azurerm_lb"
  lbs      = var.lbs
  sku      = var.sku
  location = var.location
  prefix   = var.prefix
  tags     = var.tags
}
module "lb_rule" {
  source   = "../../modules/tfs_azurerm_lbrules"
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
module "vnet" {
  source   = "../../modules/tfs_azurerm_truth/network"
  location = var.location
}

# taking subnet ids for storage account one for subnet_id that is for private endpoint and one for network rules that is subnet_ids variable
module "network" {
  count    = terraform.workspace == "hub" ? 0 : 1
  source   = "../../modules/tfs_azurerm_truth/network"
  location = var.location
}
module "hub" {
  count    = terraform.workspace == "hub" ? 1 : 0
  source   = "../../modules/tfs_azurerm_truth/hub"
  location = var.location
}
