variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable "public_ip_names" {
  description = "Public ips is a list of ip names that are connected to the firewall. At least one is required."
  type        = list(string)
  default     = ["fw-public"]
}

variable "priority" {
  type        = number
  description = "infrastructure name"
}

variable "network_rule_collections" {
  description = "Create a network rule collection"
  type = list(object({
    name     = string,
    priority = number,
    action   = string,
  }))
  default = null
}

variable "network_rules" {
  type = list(object({
    name                  = string,
    source_addresses      = list(string),
    source_ip_groups      = list(string),
    destination_ports     = list(string),
    destination_addresses = list(string),
    destination_ip_groups = list(string),
    destination_fqdns     = list(string),
    protocols             = list(string)
  }))
  default = null
}

variable "application_rule_collections" {
  description = "Create a application rule collection"
  type = list(object({
    name     = string,
    priority = number,
    action   = string,
  }))
  default = null
}

variable "app_rules" {
  type = list(object({
    name                  = string,
    source_addresses      = list(string),
    web_categories        = list(string),
    source_ip_groups      = list(string),
    destination_addresses = list(string),
    destination_fqdns     = list(string),
    protocols = list(object({
      type = string
      port = number
    }))
  }))
  default = null
}

variable "nat_rule_collections" {
  description = "Create a nat rule collection"
  type = list(object({
    name     = string,
    priority = number,
    action   = string,
  }))
  default = null
}

variable "nat_rules" {
  type = list(object({
    name                  = string,
    source_addresses      = list(string),
    destination_ports     = list(string),
    source_ip_groups      = list(string),
    destination_addresses = string,
    translated_port       = string,
    translated_address    = string,
    protocols             = list(string)
  }))
  default = null
}
