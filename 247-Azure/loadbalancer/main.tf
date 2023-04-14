#Module for Load Balancer
module "lb" {
  source   = "../module/tfs_azurerm_lb"
  location = var.location
  sku      = var.sku
  prefix   = var.prefix
  lbs      = var.lbs
  tags     = var.tags
}

