module "vm" {
  source                         = "../../modules/tfs_azurerm_compute"
  instance_config                = var.instance_config
  principal_id                   = var.principal_id
  backend_id                     = []
  frontend_ip_configuration_name = []
  enable_lb                      = false
  subnet_id                      = module.vnet.cde_app
  mount_list                     = var.mount_list
  enable_pip                     = false
  pip_count                      = var.pip_count
  increase_nic                   = false
  nic_id                         = ""
  fileshare_name                 = ["//tfsspeechdeveast.file.core.windows.net/wcr-decrypt"]
}

module "vnet" {
  source   = "../../modules/tfs_azurerm_truth/network"
  location = var.location
}
