module "vm" {
  source                         = "../modules/tfs_azurerm_compute"
  instance_config                = var.instance_config
  principal_id                   = var.principal_id
  frontend_ip_configuration_name = null
  enable_lb                      = false
  backend_id                     = null
}
