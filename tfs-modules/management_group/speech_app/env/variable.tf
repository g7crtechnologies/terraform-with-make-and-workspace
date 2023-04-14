variable "parent_management_group_name" {
  description = "Name of parent management group id"
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name of management group"
  type        = string
  default     = "hub"
}

variable "parent_management_group_id" {
  description = "ID of parent management group id"
  type        = string
  default     = null
}

variable "subscription_ids" {
  description = "To enable the Subscription for management group (Default is True)"
  type        = list(string)
  default     = null
}
variable "pid" {
  description = "To take the parent ID from the variable or Remote State (Default is True) "
  type        = bool
  default     = true
}

variable "remote_state" {
  description = "Value from Remote State"
  type        = string
  default     = null
}
