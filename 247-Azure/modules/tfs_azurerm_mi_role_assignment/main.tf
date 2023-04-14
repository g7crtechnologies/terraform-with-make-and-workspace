data "azurerm_client_config" "current" {}

data "azurerm_role_definition" "mi" {
  name = var.role_definition_name
}

resource "azurerm_role_assignment" "vm_login_role_assignment" {
  count              = length(var.role_definition_name)
  scope              = var.subcription_scope_enable == true ? "subscriptions/${data.azurerm_client_config.current.subscription_id}" : var.scope
  role_definition_id = data.azurerm_role_definition.mi.id
  principal_id       = var.principal_id
}




