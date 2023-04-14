variable "env" {
  description = "Environment"
  type        = any
  default     = "hub"
}

variable "region" {
  description = "region for resources"
  type        = string
  default     = "eu"
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

variable "location" {
  description = "location of rg"
  type        = string
  default     = "eastus"
}
