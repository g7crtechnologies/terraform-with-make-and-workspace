variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus"
}

variable "secret_value" {
  description = "secret value for private key"
  default     = ""
}

variable "ssh_key_map" {
  description = "ssh key name"
  type = map(map(object({
    ssh_key_name    = string
    ssh_key_rg_name = string
  })))
  default = {
    "hub" = {
      "hub" = {
        ssh_key_name    = "hub"
        ssh_key_rg_name = "hub"
      }
    }
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
