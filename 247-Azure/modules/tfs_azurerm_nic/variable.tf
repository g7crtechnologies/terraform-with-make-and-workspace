variable "location" {
  type        = string
  default     = "eastus"
  description = "location to deploy cs"
}

variable "component" {
  type        = string
  default     = "speech"
  description = "name of component"
}

variable "nsg_name" {
  type        = string
  default     = "tfs-nsg-dev-east-01"
  description = "name of nsg"
}

variable "nic_count" {
  type        = string
  default     = 1
  description = "no of nic"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "subnet_id"
}

variable "tags" {
  type = any
  default = {
    "terraform" = "1"
  }
  description = "resource tags"
}

