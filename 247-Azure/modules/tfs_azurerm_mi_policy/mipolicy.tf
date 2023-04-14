resource "azurerm_policy_definition" "identity_policy" {
  name         = "deny-unauthorized-identity-creation"
  display_name = "Deny creation of unauthorized Managed Identities"
  policy_type  = "BuiltIn"
  mode         = "All"

  policy_rule = jsonencode({
    "if" : {
      "allOf" : [
        {
          "field" : "type",
          "equals" : "Microsoft.ManagedIdentity/userAssignedIdentities"
        },
        {
          "not" : {
            "field" : "Microsoft.ManagedIdentity/userAssignedIdentities/ownerId",
            "in" : [
              "SYSTEM_ASSIGNED",
              "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', parameters('allowedOwnersResourceGroup'), '/providers/Microsoft.ManagedIdentity/userAssignedIdentities/', parameters('allowedOwnersIdentityName'))]"
            ]
          }
        }
      ]
    },
    "then" : {
      "effect" : "deny"
    }
  })
}

resource "azurerm_policy_assignment" "identity_policy_assignment" {
  name                 = "deny-unauthorized-identity-creation-assignment"
  policy_definition_id = azurerm_policy_definition.identity_policy.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.id}/providers/Microsoft.Authorization/policyAssignments/${azurerm_policy_definition.identity_policy.name}"
  parameters = jsonencode({
    allowedOwnersResourceGroup = "my-resource-group"
    allowedOwnersIdentityName  = "my-identity"
  })
}
