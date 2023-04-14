<!-- BEGIN_TF_DOCS -->
## **Express route**
To create express route and virtual network gateway in both hub subscription 
These are the commands
###### For eastus
       -	“make az-er-eu” to set hub subscription in eastus
       -	“make plan-er-eu”  to plan the terraform 
       -	“make apply-er-eu” to apply the terraform 
###### For westus 
       -	“make az-er-wu” to set hub subscription in westus
       -	“make plan-er-wu”  to plan the terraform 
       -	“make apply-er-wu” to apply the terraform
       
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.36.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ExpressRoute"></a> [ExpressRoute](#module\_ExpressRoute) | ../module/tfs_azurerm_er | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorization_name"></a> [authorization\_name](#input\_authorization\_name) | authorization name for express route | `string` | `"auth_name"` | no |
| <a name="input_con_config"></a> [con\_config](#input\_con\_config) | Object type of data for Express Route Connection Configuration | <pre>object({<br>    name              = string<br>    type              = string<br>    authorization_key = string<br>  })</pre> | <pre>{<br>  "authorization_key": "XJbFYyIQQD56H8mgAtl",<br>  "name": "connections_gw",<br>  "type": "ExpressRoute"<br>}</pre> | no |
| <a name="input_er_config"></a> [er\_config](#input\_er\_config) | Object type of data for Express Route Configuration | <pre>object({<br>    name                     = string<br>    service_provider_name    = string<br>    peering_location         = string<br>    bandwidth_in_mbps        = number<br>    allow_classic_operations = optional(bool)<br>  })</pre> | <pre>{<br>  "allow_classic_operations": false,<br>  "bandwidth_in_mbps": 1,<br>  "name": "er_gatway",<br>  "peering_location": "Silicon Valley",<br>  "service_provider_name": "AT&T Netbond"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | location of express route | `string` | n/a | yes |
| <a name="input_pip_allocation_method"></a> [pip\_allocation\_method](#input\_pip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic | `string` | `"Static"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `string` | `"Standard"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU For express Route | <pre>object({<br>    tier   = string<br>    family = string<br>  })</pre> | <pre>{<br>  "family": "MeteredData",<br>  "tier": "Standard"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `null` | no |
| <a name="input_vng_config"></a> [vng\_config](#input\_vng\_config) | Object type of data for Virtual Network Gateway Configuration | <pre>object({<br>    name          = string<br>    type          = string<br>    sku           = string<br>    active_active = optional(bool)<br>  })</pre> | <pre>{<br>  "active_active": false,<br>  "name": "vpn_gateway",<br>  "sku": "HighPerformance",<br>  "type": "ExpressRoute"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->