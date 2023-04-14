
variable "location" {
  type        = string
  description = "desired locations for resources"
}


variable "containers" {
  type        = any
  description = "name of containers"
}

variable "fileshare" {
  type        = any
  description = "name of fileshare"
}

variable "tags" {
  type        = any
  description = "required tags for resource"
}

variable "env" {
  description = "Environment"
  type        = any
}

variable "subnet_id" {
  description = "subnet id for private endpoint"
  type        = any
}

variable "subnet_ids" {
  description = "list of subnet ids for network rules"
  type        = any
}


variable "enable_pe" {
  description = "true / false value to enable or disable private endpoint"
  type        = bool
}

variable "enable_fs" {
  description = "true / false value to enable or disable file system"
  type        = bool
}

variable "enable_con" {
  description = "true / false value to enable or disable containers"
  type        = bool
}