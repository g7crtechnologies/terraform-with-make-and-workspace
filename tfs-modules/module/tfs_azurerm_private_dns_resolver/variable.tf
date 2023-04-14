variable "private_dns_zone_name" {
  type        = string
  description = "Pvt dns zone name"
}

variable "location" {
  type        = string
  description = "(Required): Region / Location where Azure DNS Resolver should be deployed"
}

variable "dns_resolver_name" {
  type        = string
  description = "(Required): Name of the Azure DNS Private Resolver"
}

variable "dns_resolver_inbound_endpoints" {
  description = "(Optional): Set of Azure Private DNS resolver Inbound Endpoints"
  type        = string
  default     = "inbound"
}

variable "dns_resolver_outbound_endpoints" {
  description = "(Optional): Set of Azure Private DNS resolver Outbound Endpoints with one or more Forwarding Rule sets"
  type        = string
  default     = "outbound"
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
    prod = {
      environment        = "dev"
      finance_allocation = "finance_allocation"
      project_owner      = "speech"
      product            = "speech"
      product_component  = "apigee"
      network_segment    = "c2c"
      type_of_appliance  = "web"
      risk_zone          = "zone1"
      appliance_owner    = "networking"
    }
  }
}

variable "inbound_subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.1.0.0/24"]
  description = "List of inbound subnet address prefixes"
}

variable "outbound_subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.1.1.0/24"]
  description = "List of outbound subnet address prefixes"
}

variable "target_domain_name" {
  type        = string
  default     = "247-inc.net."
  description = "target domain name for forwarding rule"
}

variable "target_ip" {
  type = any
  default = {
    ip1 = {
      ip_address = "10.10.0.4"
      port       = "53"
    }
    ip2 = {
      ip_address = "10.10.0.4"
      port       = "53"
    }
  }
  description = "target ip of dc"
}

variable "target_ip_gcp" {
  type = any
  default = {
    ip1 = {
      ip_address = "10.10.0.4"
      port       = "53"
    }
    ip2 = {
      ip_address = "10.10.0.4"
      port       = "53"
    }
  }
  description = "target ip of gcp"
}

variable "forwarding_ruleset_outbound_name" {
  type        = string
  default     = "test-ruleset"
  description = "rule set name"
}

variable "subnet_in" {
  type        = string
  default     = "dns-in"
  description = "inbound subnet range"
}

variable "subnet_out" {
  type    = string
  default = "outbound subnet range"
}
