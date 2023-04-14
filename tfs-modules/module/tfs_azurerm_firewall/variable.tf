
variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "eastus"
}

variable "public_ip_names" {
  description = "Public ips is a list of ip names that are connected to the firewall. At least one is required."
  type        = list(string)
  default     = ["fw-public"]
}

variable "firewall_config" {
  description = "Manages an Azure Firewall configuration"
  type = object({
    name              = string
    sku_name          = optional(string)
    sku_tier          = optional(string)
  })
  default = {
    name     = "hub"
    sku_name = "AZFW_VNet"
    sku_tier = "Standard"
  }
}

variable "enable_forced_tunneling" {
  description = "Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet"
  default     = false
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

variable "firewall_subnet" {
  description = "azure firewall subnet"
  type = list(string)
  default = ["10.88.48.0/26"]
}

variable "firewall_policy" {
  description = "Manages an Azure Firewall policy configuration"
  type = object({
    name                     = string
    sku_tier                 = optional(string)
    threat_intelligence_mode = optional(string)
  })
}