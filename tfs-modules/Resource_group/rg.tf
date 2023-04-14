#------------------------------------------
# Module for Resource Group
#------------------------------------------
module "rg" {
  source    = "../module/tfs_azurerm_rg"
  env       = var.env
  region    = var.region
  location  = var.location
  tags      = var.tags
}

