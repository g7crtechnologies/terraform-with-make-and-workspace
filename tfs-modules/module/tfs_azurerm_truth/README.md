<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.rg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.subnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | location of vnet | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app-gw"></a> [app-gw](#output\_app-gw) | n/a |
| <a name="output_c2c_app"></a> [c2c\_app](#output\_c2c\_app) | # other vnets subnet id |
| <a name="output_c2c_app_db"></a> [c2c\_app\_db](#output\_c2c\_app\_db) | n/a |
| <a name="output_c2c_lb"></a> [c2c\_lb](#output\_c2c\_lb) | n/a |
| <a name="output_cde_ap_db"></a> [cde\_ap\_db](#output\_cde\_ap\_db) | n/a |
| <a name="output_cde_app"></a> [cde\_app](#output\_cde\_app) | n/a |
| <a name="output_cde_lb"></a> [cde\_lb](#output\_cde\_lb) | n/a |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | ## hub subnet id |
| <a name="output_gateway"></a> [gateway](#output\_gateway) | n/a |
| <a name="output_lb"></a> [lb](#output\_lb) | n/a |
| <a name="output_mgmt"></a> [mgmt](#output\_mgmt) | n/a |
| <a name="output_oos_app"></a> [oos\_app](#output\_oos\_app) | n/a |
| <a name="output_oos_app_db"></a> [oos\_app\_db](#output\_oos\_app\_db) | n/a |
| <a name="output_oos_lb"></a> [oos\_lb](#output\_oos\_lb) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | resoucrce group name output for remotstate call |
| <a name="output_vnet_c2c"></a> [vnet\_c2c](#output\_vnet\_c2c) | other env vnet id |
| <a name="output_vnet_c2c_name"></a> [vnet\_c2c\_name](#output\_vnet\_c2c\_name) | other vnets name |
| <a name="output_vnet_cde"></a> [vnet\_cde](#output\_vnet\_cde) | n/a |
| <a name="output_vnet_cde_name"></a> [vnet\_cde\_name](#output\_vnet\_cde\_name) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | hub vnet id |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | hub vnet name |
| <a name="output_vnet_oos"></a> [vnet\_oos](#output\_vnet\_oos) | n/a |
| <a name="output_vnet_oos_name"></a> [vnet\_oos\_name](#output\_vnet\_oos\_name) | n/a |
<!-- END_TF_DOCS -->