locals {
  resource_group_name = module.rg.rg_name
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

resource "azurerm_dns_zone" "dns" {
  name                = var.dns_zone_name
  resource_group_name = local.resource_group_name
  tags = var.tags[terraform.workspace]
}
