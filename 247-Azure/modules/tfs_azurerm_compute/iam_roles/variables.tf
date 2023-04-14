variable "principal_id" {
  description = "list of principal id you want to assign"
  type        = list(string)
  default = ["7c4b947d-25ef-46fd-ad99-39fa549587d2"]
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
