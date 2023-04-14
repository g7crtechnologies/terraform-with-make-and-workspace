location = "westus"
name     = "activitylog"
logs = [
  {
    enabled        = false
    name           = "AuditEvent"
    retention_days = 0
  }
]
metrics = [
  {
    enabled        = false
    name           = "AllMetrics"
    retention_days = 0
  }
]
