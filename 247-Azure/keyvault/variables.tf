variable "key_vault_map" {
  type = map(map(object({
    name        = string
    sku         = string
    key_per     = list(string)
    secret_per  = list(string)
    storage_per = list(string)
  })))
  default = {
    "hub" = {
      "hub" = {
        key_per     = ["Get"]
        name        = "hub"
        secret_per  = ["Get"]
        sku         = "standard"
        storage_per = ["Get"]
      }
    }
  }
  description = "name of key vault"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus"
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
