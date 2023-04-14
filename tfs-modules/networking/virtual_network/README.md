<!-- BEGIN_TF_DOCS -->
## **Virtual network**
This module creates the virtual network for each environment along with nsg’ s , route tables
And subnets 

       -    “Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | =3.4.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../module/tfs_azurerm_vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | <pre>map(map(object({<br>    name          = string<br>    address_space = list(string)<br>    product       = string<br>  })))</pre> | <pre>{<br>  "prod": {<br>    "prod-c2c": {<br>      "address_space": [<br>        "10.89.0.0/20"<br>      ],<br>      "name": "prod-c2c",<br>      "product": "aiva"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | location of vnets | `string` | `"eastus"` | no |
| <a name="input_region"></a> [region](#input\_region) | pci\_type name for naming convention | `string` | `"eu"` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `any` | <pre>{<br>  "hub1": {<br>    "address_prefixes": [<br>      "10.88.48.0/26"<br>    ],<br>    "name": "azurefirewall",<br>    "product": "aiva",<br>    "skey": "hub"<br>  }<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "owner": "g7"<br>}</pre> | no |

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
| <a name="output_vnet_c2c"></a> [vnet\_c2c](#output\_vnet\_c2c) | other env vnet id |
| <a name="output_vnet_c2c_name"></a> [vnet\_c2c\_name](#output\_vnet\_c2c\_name) | other vnets name |
| <a name="output_vnet_cde"></a> [vnet\_cde](#output\_vnet\_cde) | n/a |
| <a name="output_vnet_cde_name"></a> [vnet\_cde\_name](#output\_vnet\_cde\_name) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_oos"></a> [vnet\_oos](#output\_vnet\_oos) | n/a |
| <a name="output_vnet_oos_name"></a> [vnet\_oos\_name](#output\_vnet\_oos\_name) | n/a |
<!-- END_TF_DOCS -->