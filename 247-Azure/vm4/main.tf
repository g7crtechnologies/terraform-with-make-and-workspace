module "vm" {
  source          = "../modules/tfs_azurerm_compute"
  instance_config = var.instance_config
  principal_id    = var.principal_id
}
