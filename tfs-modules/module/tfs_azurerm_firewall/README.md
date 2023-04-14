<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.36.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.36.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.fw](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/firewall) | resource |
| [azurerm_public_ip.fw-mgnt-pip](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip.fw-pip](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/public_ip) | resource |
| [azurerm_public_ip_prefix.fw-pref](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/public_ip_prefix) | resource |
| [azurerm_subnet.fw-mgnt-snet](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/subnet) | resource |
| [azurerm_subnet.fw-snet](https://registry.terraform.io/providers/hashicorp/azurerm/3.36.0/docs/resources/subnet) | resource |
| [terraform_remote_state.rg](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vnet](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | `false` | no |
| <a name="input_enable_forced_tunneling"></a> [enable\_forced\_tunneling](#input\_enable\_forced\_tunneling) | Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet | `bool` | `false` | no |
| <a name="input_firewall_config"></a> [firewall\_config](#input\_firewall\_config) | Manages an Azure Firewall configuration | <pre>object({<br>    name     = string<br>    sku_name = optional(string)<br>    sku_tier = optional(string)<br>  })</pre> | <pre>{<br>  "name": "hub",<br>  "sku_name": "AZFW_VNet",<br>  "sku_tier": "Standard"<br>}</pre> | no |
| <a name="input_firewall_management_subnet_address_prefix"></a> [firewall\_management\_subnet\_address\_prefix](#input\_firewall\_management\_subnet\_address\_prefix) | The address prefix to use for Firewall managemement subnet to enable forced tunnelling. The Management Subnet used for the Firewall must have the name `AzureFirewallManagementSubnet` and the subnet mask must be at least a `/26`. | `list` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_firewall_service_endpoints"></a> [firewall\_service\_endpoints](#input\_firewall\_service\_endpoints) | Service endpoints to add to the firewall subnet | `list(string)` | <pre>[<br>  "Microsoft.AzureActiveDirectory",<br>  "Microsoft.AzureCosmosDB",<br>  "Microsoft.EventHub",<br>  "Microsoft.KeyVault",<br>  "Microsoft.ServiceBus",<br>  "Microsoft.Sql",<br>  "Microsoft.Storage"<br>]</pre> | no |
| <a name="input_firewall_subnet_address_prefix"></a> [firewall\_subnet\_address\_prefix](#input\_firewall\_subnet\_address\_prefix) | The address prefix to use for the Firewall subnet.The Subnet used for the Firewall must have the name AzureFirewallSubnet and the subnet mask must be at least a /26. | `list` | <pre>[<br>  "10.0.0.0/24"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `"eastus"` | no |
| <a name="input_public_ip_names"></a> [public\_ip\_names](#input\_public\_ip\_names) | Public ips is a list of ip names that are connected to the firewall. At least one is required. | `list(string)` | <pre>[<br>  "fw-public"<br>]</pre> | no |
| <a name="input_public_ip_prefix_length"></a> [public\_ip\_prefix\_length](#input\_public\_ip\_prefix\_length) | Specifies the number of bits of the prefix. The value can be set between 0 (4,294,967,296 addresses) and 31 (2 addresses). | `number` | `31` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | `"tfs-rg-hub-eu-speech"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `null` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of your Azure Virtual Network | `string` | `"tfs-vnet-hub-eu-speech"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->