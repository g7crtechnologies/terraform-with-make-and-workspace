location = "eastus"
name     = "activitylog"
logs = [
  {
    enabled        = true
    name           = "allLogs"
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
