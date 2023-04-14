output "def_id" {
  value = [
    for definition_id in azurerm_role_definition.custom_role : definition_id.role_definition_resource_id
  ]
}