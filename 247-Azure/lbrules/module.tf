module "load_balancer" {
  source     = "../modules/tfs_azurerm_lbrules"
  location   = var.location
  prefix     = var.prefix
  LbRules    = var.LbRules
}
