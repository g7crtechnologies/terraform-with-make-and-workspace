variable "location" {
  description = "The location of the vnet to create."
  type        = string
}

variable "nsg" {
  type        = string
  description = "the name of nsg "
}

variable "nsg_rule" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = optional(string)
    destination_port_ranges    = optional(list(string))
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default     = {}
  description = "network security rules for nsg"
}


