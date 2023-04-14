module "diagnostic" {
  source       = "../modules/tfs_azurerm_moniter_log_profile"
  location     = var.location
  logs_profile = var.logs_profile
}
