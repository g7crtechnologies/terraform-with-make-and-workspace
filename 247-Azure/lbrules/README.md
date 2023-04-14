 <!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.37.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ../module | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_LbRules"></a> [LbRules](#input\_LbRules) | List containing your load balancers parameters. | `any` | n/a | yes |
| <a name="input_Lbs"></a> [Lbs](#input\_Lbs) | List containing your load balancers. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the load balancer, use the RG's location if not set | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix applied on the load balancer resources names. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name of the load balancer. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU of the load balancer. | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet list | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->