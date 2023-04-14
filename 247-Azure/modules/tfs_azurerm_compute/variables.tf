#This variable contain all the expected parameter values of compute module
variable "instance_config" {
  description = "See tfs_compute for documentation."
}

# This variable is holding a list of principal ids that will be assigned to virtual machine at creation time
variable "principal_id" {
  description = "list of principal id you want to assign"
  type        = list(string)
}
variable "backend_id" {
  type        = list(string)
  description = "backend pool id "
}

variable "frontend_ip_configuration_name" {
  type        = list(string)
  description = "frontend_ip_configuration_name id "
}

variable "enable_lb" {
  type        = bool
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "subnet_id" {
  type        = string
  description = "app subnet id for c2c ,cde, oos vnet"
}

variable "mount_list" {
  type        = list(string)
  description = "mount list for disk"
}

variable "fileshare_name" {
  type        = list(string)
  description = "list of fileshares for components"
}

variable "enable_pip" {
  type        = bool
  description = "to enable the pip for some component"
}

variable "pip_count" {
  type        = string
  description = "pip count"
}

variable "increase_nic" {
  type        = bool
  description = "to create more nic ids"
}

variable "nic_id" {
  type        = any
  description = "list of nic ids"
}
