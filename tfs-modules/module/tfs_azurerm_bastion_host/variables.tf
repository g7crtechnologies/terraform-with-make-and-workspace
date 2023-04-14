
variable "sku" {
  type        = string
  description = "Azure Bastion Host Service SKU"
  default     = "Basic" // Basic or Standard
}

variable "scale_units" {
  type        = string
  description = "Azure Bastion Host Service Scale Units"
  default     = 2 // Basic = 2 or Standard = 2 to 50
}

# azure region
variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "north europe"
}

variable "subnet_cidr" {
  type        = list(string)
  description = "subnet cidr bastion host"
  default     = ["10.88.58.0/26"]
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