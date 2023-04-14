variable "principal_id" {
  description = "list of principal id you want to assign"
  type        = string
}
variable "location" {
  description = "location"
  type        = string
}

variable "subcription_scope_enable" {
  description = "to enable the scope to subscription"
  type        = bool
  default     = false
}

variable "scope" {
  description = "scope to assign"
  type        = string
  default     = ""
}

variable "role_definition_name" {
  description = "scope to assign"
  type        = list(string)
  default     = ""
}
