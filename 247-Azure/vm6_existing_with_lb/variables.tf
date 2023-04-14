
variable "LbRules" {
  description = "List containing your load balancers parameters."
  type        = any
}
variable "prefix" {
  type        = string
  description = "Prefix applied on the load balancer resources names."
}

variable "location" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "lb_name" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "lb_creation" {
  type        = bool
  description = "true and false value to create loadbalancer or not"
}

variable "nic_name" {
  type        = list(string)
  description = "nic name for existing vm"
}

variable "nic_rg" {
  type        = string
  description = "nic rg name for existing vm"
}

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
