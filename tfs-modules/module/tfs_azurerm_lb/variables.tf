variable "lbs" {
  description = "List containing your load balancers."
  type        = any
  default = {
    prod = {
      prod-c2c = {
        name        = "prod-c2c"
        description = "aiva"
      }
      prod-cde = {
        name        = "prod-cde"
        description = "aiva"
      }
      prod-oos = {
        name        = "prod-oos"
        description = "aiva"
      }
    }
  }
}
variable "prefix" {
  description = "Prefix applied on the load balancer resources names."
  type        = any
  default     = "tfs-ilb"
}

variable "location" {
  description = "Location of the load balancer, use the RG's location if not set"
  type        = any
  default     = "eastus"
}

variable "sku" {
  description = "SKU of the load balancer."
  type        = any
  default     = "Standard"
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
