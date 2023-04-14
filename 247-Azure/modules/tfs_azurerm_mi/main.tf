module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = module.rg.rg_name
}
