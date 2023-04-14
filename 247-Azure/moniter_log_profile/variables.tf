variable "location" {
  description = "location"
  type        = string
}

variable "logs_profile" {
  description = "Logs that needs to be enabled"
  type = map(object({
    name           = string,
    categories     = list(string)
    locations      = list(string)
    enabled        = bool,
    retention_days = optional(number),
  }))
  default = {
    "log_profile" =     {
      categories = [
        "Action",
        "Delete",
        "Write",
      ]
      enabled = true
      locations = [
        "eastus",
        "westus",
        "global",
      ]
      name           = "dev"
      retention_days = 365
    }
  }
}
