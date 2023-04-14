module "routes" {
  source           = "../modules/tfs_azurerm_routes"
  location         = var.location
  routes           = var.routes
}
