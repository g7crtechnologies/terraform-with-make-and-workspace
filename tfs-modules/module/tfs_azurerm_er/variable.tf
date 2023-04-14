variable "location" {
  description = "location of express route"
  type = string
}

variable "pip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  type        = string
  default     = "Standard"
}

variable "authorization_name" {
  type    = string
  default = "auth_name"
  description = "authorization name for express route"
}

variable "er_config" {
  description = "Object type of data for Express Route Configuration"
  type = object({
    name                     = string
    service_provider_name    = string
    peering_location         = string
    bandwidth_in_mbps        = number
    allow_classic_operations = optional(bool)
  })
  default = {
    bandwidth_in_mbps        = 1
    name                     = "er_gatway"
    peering_location         = "Silicon Valley"
    service_provider_name    = "AT&T Netbond"
    allow_classic_operations = false
  }
}

variable "sku" {
  description = "SKU For express Route"
  type = object({
    tier   = string
    family = string
  })
  default = {
    family = "MeteredData"
    tier   = "Standard"
  }
}

variable "vng_config" {
  description = "Object type of data for Virtual Network Gateway Configuration"
  type = object({
    name          = string
    type          = string
    sku           = string
    active_active = optional(bool)
  })
  default = {
    name          = "vpn_gateway"
    sku           = "HighPerformance"
    type          = "ExpressRoute"
    active_active = false
  }
}

variable "con_config" {
  description = "Object type of data for Express Route Connection Configuration"
  type = object({
    name              = string
    type              = string
  })
  default = {
    name              = "connections_gw"
    type              = "ExpressRoute"
  }
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

variable "gateway_subnet" {
  description = "azure firewall subnet"
  type = list(string)
  default = ["10.88.48.64/26"]
}