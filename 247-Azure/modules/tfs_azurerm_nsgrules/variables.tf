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
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    destination_port_range       = optional(string)
    destination_port_ranges      = optional(list(string))
    source_address_prefix        = optional(string)
    destination_address_prefix   = optional(string)
    source_address_prefixes      = optional(list(string))
    destination_address_prefixes = optional(list(string))
    description                  = optional(string)
  }))
  default     = {}
  description = "network security rules for nsg"
}


