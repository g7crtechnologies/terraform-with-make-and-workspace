module "nic" {
  source    = "../modules/tfs_azurerm_nic"
  location  = var.location
  component = var.component
  nic_count = var.nic_count
  subnet_id = terraform.workspace == "hub" ? module.hub[0].cde_app_db : module.network[0].cde_app_db
  nsg_name  = var.nsg_name
  tags      = var.tags
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
