module "custom_role" {
  source          = "../modules/tfs_azurerm_custom_role"
  subscription_id = var.subscription_id
  custom_roles    = var.custom_roles
  location        = var.location
}
