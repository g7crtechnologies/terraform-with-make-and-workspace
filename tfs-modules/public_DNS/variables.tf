variable "dns_zone_name" {
  type        = string
  description = "Pvt dns zone name"
}

variable "location" {
  type        = string
  description = "(Required): Region / Location where Azure DNS Resolver should be deployed"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
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