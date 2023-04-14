module "peering" {
  source = "../module/tfs_azurerm_peering"
  location = var.location
}