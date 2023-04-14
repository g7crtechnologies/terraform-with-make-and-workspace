<!-- BEGIN_TF_DOCS -->
# Management Group
this module will create management group in desired structure for 247.ai for each mg it has different tfvars file it will assign subscription also on which management group you want assign 
   makefile commands
   
    -     "make plan-mg"    to make a plan for all the mangement group 
    -     "make apply-mg"   to deploy the all mangement group
    
to deploy one by one follow these commands
    -     "make plan-hub"         to plan hub mg
    -     "make apply-hub"        to apply hub mg
    -     "make plan-iac"         to plan iac mg 
    -     "make apply-iac"        to apply iac mg
    -     "make plan-products"    to plan products mg 
    -     "make apply-products"   to apply products mg

after these management you have to change the directory cd \speech_app\ for creating speech application managemnet group
   
    -     "make plan-speech_application"    to plan speech_application mg 
    -     "make apply-speech_application"   to apply speech_application mg  

again need to change the directory to "env" and same command for other mg's

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =3.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mg"></a> [mg](#module\_mg) | ../module/tfs_azurerm_mg | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.0/docs/data-sources/subscription) | data source |

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
| <a name="output_mg_id"></a> [mg\_id](#output\_mg\_id) | Output for Management Group ID |
<!-- END_TF_DOCS -->