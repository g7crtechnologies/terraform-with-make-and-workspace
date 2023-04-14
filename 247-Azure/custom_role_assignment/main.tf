module "custom_role" {
  source                   = "../modules/tfs_azurerm_compute/iam_roles"
  principal_id             = var.principal_id
  location                 = var.location
  scope                    = var.scope
  subcription_scope_enable = var.subcription_scope_enable
}
