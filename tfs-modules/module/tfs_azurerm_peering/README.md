<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.0 |
| <a name="provider_azurerm.hub"></a> [azurerm.hub](#provider\_azurerm.hub) | ~>3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_truth"></a> [truth](#module\_truth) | ../tfs_azurerm_truth | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.peering_destination_to_source](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peering_source_to_destination](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network.hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | location | `string` | `"eastus"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->