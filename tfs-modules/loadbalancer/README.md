<!-- BEGIN_TF_DOCS -->
## **Load balancer**
This will deploy load balancer for each vnet in different subscription 

       -	“Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 

Commands are same for westus region  “eu” replaced by “wu”

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.37.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb"></a> [lb](#module\_lb) | ../module/tfs_azurerm_lb | n/a |

## Resources

No resources.

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