module "managed_identity" {
  source              = "../modules/tfs_azurerm_mi"
  name                = var.name
  location            = var.location
}