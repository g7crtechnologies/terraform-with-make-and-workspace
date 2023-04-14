<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.infra](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | Environment | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | location of rg | `string` | `"eastus"` | no |
| <a name="input_region"></a> [region](#input\_region) | region for resources | `string` | `"eu"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | resoucrce group name output for remotstate call |
<!-- END_TF_DOCS -->