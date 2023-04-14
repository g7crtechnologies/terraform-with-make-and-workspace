variable "name" {
  description = "Name of the diagnostics setting name"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "logs" {
  description = "Logs that needs to be enabled"
  type = list(object({
    name           = string,
    enabled        = bool,
    retention_days = optional(number),
  }))
  default = [
    {
      name           = "AuditEvent",
      enabled        = false,
      retention_days = 0,
    }
  ]
}

variable "metrics" {
  description = "metrics that needs to be enabled"
  type = list(object({
    name           = optional(string),
    enabled        = optional(bool),
    retention_days = optional(number),
  }))
  default = [
    {
      name           = "AllMetrics",
      enabled        = false,
      retention_days = 0,
    }
  ]
}