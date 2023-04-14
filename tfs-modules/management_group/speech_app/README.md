<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.29.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mg"></a> [mg](#module\_mg) | ../../module/tfs_azurerm_mg | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/subscription) | data source |
| [terraform_remote_state.speech-application](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display name of management group | `string` | `"hub"` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of Key Vault | `string` | `"tfs-kv-hub-eu-speech"` | no |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | Resource group name of Key Vault | `string` | `"tfs-rg-hub-eu-speech"` | no |
| <a name="input_parent_management_group_id"></a> [parent\_management\_group\_id](#input\_parent\_management\_group\_id) | ID of parent management group id | `string` | `null` | no |
| <a name="input_parent_management_group_name"></a> [parent\_management\_group\_name](#input\_parent\_management\_group\_name) | Name of parent management group id | `string` | `null` | no |
| <a name="input_pid"></a> [pid](#input\_pid) | To take the parent ID from the variable or Remote State (Default is True) | `bool` | `true` | no |
| <a name="input_remote_state"></a> [remote\_state](#input\_remote\_state) | Value from Remote State | `string` | `null` | no |
| <a name="input_secrets_name"></a> [secrets\_name](#input\_secrets\_name) | Secret name in Key Vault | `string` | `"hub"` | no |
| <a name="input_subscription_enable"></a> [subscription\_enable](#input\_subscription\_enable) | To enable the Subscription for management group (Default is True) | `string` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mg_id"></a> [mg\_id](#output\_mg\_id) | Output of management group ID |
<!-- END_TF_DOCS -->