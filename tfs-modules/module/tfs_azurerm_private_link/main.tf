locals {
  region              = var.location == "eastus" ? "eu" : "wu"
  vnet_id             = module.hub.vnet_id
  domain_name         = module.hub.domain_name
}


module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = lower("tfs-dns-link-${terraform.workspace}-${local.region}-speech")
  resource_group_name   = "tfs-rg-hub-eu-landingzone"
  private_dns_zone_name = local.domain_name
  virtual_network_id    = local.vnet_id
  registration_enabled  = false
  tags = var.tags[terraform.workspace]
}
