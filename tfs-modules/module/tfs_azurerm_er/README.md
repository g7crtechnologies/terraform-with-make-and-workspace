<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.36.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_express_route_circuit.er_circuit](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/express_route_circuit) | resource |
| [azurerm_express_route_circuit_authorization.expressroute_cr](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/express_route_circuit_authorization) | resource |
| [azurerm_public_ip.pip_gw](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network_gateway.vpngw](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.expressroute](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/virtual_network_gateway_connection) | resource |
| [random_string.str](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [terraform_remote_state.rg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

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