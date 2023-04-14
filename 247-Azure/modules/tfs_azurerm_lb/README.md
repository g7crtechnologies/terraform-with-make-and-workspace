<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/lb) | resource |
| [terraform_remote_state.rg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.subnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lbs"></a> [lbs](#input\_lbs) | List containing your load balancers. | `any` | <pre>{<br>  "prod": {<br>    "prod-c2c": {<br>      "description": "aiva",<br>      "name": "prod-c2c"<br>    },<br>    "prod-cde": {<br>      "description": "aiva",<br>      "name": "prod-cde"<br>    },<br>    "prod-oos": {<br>      "description": "aiva",<br>      "name": "prod-oos"<br>    }<br>  }<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the load balancer, use the RG's location if not set | `any` | `"eastus"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix applied on the load balancer resources names. | `any` | `"tfs-ilb"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU of the load balancer. | `any` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for loadbalancer | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->