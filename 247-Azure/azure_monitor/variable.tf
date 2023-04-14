variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Location of the Azure resources"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes of the subnet"
  type        = list(string)
}

variable "public_ip_name" {
  description = "Name of the public IP address"
  type        = string
}

variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
}

variable "ip_configuration_name" {
  description = "Name of the IP configuration"
  type        = string
}

variable "virtual_machine_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "virtual_machine_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "os_admin_username" {
  description = "Username of the virtual machine administrator"
  type        = string
}

variable "os_admin_password" {
  description = "Password of the virtual machine administrator"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_solution_name" {
  description = "Name of the Log Analytics solution"
  type        = string
}

variable "data_collection_rule_name" {
  description = "Name of the Monitor Data Collection Rule"
  type        = string
}

variable "data_collection_rule_association" {
  description = "Description of the Monitor Data Collection Rule"
  type        = string
}
