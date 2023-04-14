module "private_link" {
  source   = "../module/tfs_azurerm_private_link"
  location = var.location
  tags     = var.tags
}
