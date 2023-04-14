module "tfs_azurerm_mi_role_assignment" {
  source                   = "../modules/tfs_azurerm_mi_role_assignment"
  role_definition_name     = var.role_definition_name
  subcription_scope_enable = var.subcription_scope_enable
  scope                    = var.scope
  principal_id             = var.principal_id    // managed identity id
  location                 = var.location
}
