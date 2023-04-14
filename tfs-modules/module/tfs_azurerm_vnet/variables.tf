variable "address_space" {
  type = map(map(object({
    name          = string
    address_space = list(string)
    product       = string
  })))
  description = "The address space that is used by the virtual network."
  default = {
    "prod" = {
      "prod-c2c" = {
        address_space = ["10.89.0.0/20"]
        name          = "prod-c2c"
        product       = "aiva"
      }
    }
  }
}

variable "region" {
  description = "pci_type name for naming convention"
  type        = string
  default     = "eu"
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

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = any
  default = {
    hub1 = {
      name             = "azurefirewall"
      address_prefixes = ["10.88.48.0/26"]
      skey             = "hub"
      product          = "aiva"
    }
  }
}
variable "location" {
  description = "location of vnets"
  type        = string
  default     = "eastus"
}

variable "disable_bgp_route_propagation" {
  description = "location of vnets"
  type        = bool
  default     = false
}