module "storage" {
  source     = "../modules/tfs_azurerm_storage"
  location   = var.location
  env        = var.env
  containers = var.containers
  tags       = var.tags
  subnet_id  = terraform.workspace == "hub" ? module.hub[0].mgmt : module.network[0].cde_app
  enable_fs  = var.enable_fs
  enable_pe  = var.enable_pe
  enable_con = var.enable_con
  subnet_ids = terraform.workspace == "hub" ? module.hub[0].subnet_ids : module.network[0].subnet_ids
  fileshare  = var.fileshare
}

module "network" {
  count    = terraform.workspace == "hub" ? 0 : 1
  source   = "../modules/tfs_azurerm_truth/network"
  location = var.location
}
module "hub" {
  count    = terraform.workspace == "hub" ? 1 : 0
  source   = "../modules/tfs_azurerm_truth/hub"
  location = var.location
}
