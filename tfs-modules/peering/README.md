<!-- BEGIN_TF_DOCS -->
## **Peering**
This module will peer all the vnets with hub vnet in both region 
###### commands to execute 
       -    “Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 
       
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | ../module/tfs_azurerm_peering | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | location | `string` | `"eastus"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->