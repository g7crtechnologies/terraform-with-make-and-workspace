module "diagnostic" {
  source   = "../modules/tfs_azurerm_diagnosticsetting"
  name     = var.name
  location = var.location
  logs     = var.logs
  metrics  = var.metrics
}
