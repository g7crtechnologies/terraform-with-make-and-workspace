module "mi_policy" {
  source              = "../modules/tfs_azurerm_mi_policy"
  name                = var.name
  location            = var.location
}