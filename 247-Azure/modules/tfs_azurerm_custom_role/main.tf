resource "azurerm_role_definition" "custom_role" {
  for_each    = var.custom_roles
  name        = each.value.name
  description = each.value.description
  scope       = "/subscriptions/${var.subscription_id[terraform.workspace]}"
  permissions {
    actions      = each.value.action
    data_actions = each.value.data_action
  }
  assignable_scopes = [
    "/subscriptions/${var.subscription_id[terraform.workspace]}"
  ]
}
