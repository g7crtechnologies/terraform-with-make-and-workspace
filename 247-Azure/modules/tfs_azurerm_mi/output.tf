
output "client_id" {
  value = azurerm_user_assigned_identity.this.client_id
}

output "object_id" {
  value = azurerm_user_assigned_identity.this.principal_id
}
