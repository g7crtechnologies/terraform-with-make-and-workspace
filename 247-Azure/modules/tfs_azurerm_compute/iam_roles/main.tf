locals {
  def_id = module.role_definition_id.def_id
}

module "role_definition_id" {
  source   = "../../tfs_azurerm_truth/policy_def_id"
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "vm_login_role_assignment" {
  count              = length(var.principal_id)
  scope              = var.subcription_scope_enable == true ? "subscriptions/${data.azurerm_client_config.current.subscription_id}" : var.scope
  role_definition_id = tostring(element(local.def_id, 0))
  principal_id       = tostring(var.principal_id[count.index])
}




