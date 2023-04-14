module "nsg" {
  source   = "../../modules/tfs_azurerm_nsgrules"
  nsg_rule = var.nsg_rule
  location = var.location
  nsg      = var.nsg
}
