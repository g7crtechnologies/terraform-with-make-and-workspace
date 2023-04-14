locals {
  location = var.location
  region   = var.location == "eastus" ? "eu" : "wu"
  source_vnet_id = {
    (module.vnet.vnet_c2c) = "c2c",
    (module.vnet.vnet_cde) = "cde",
    (module.vnet.vnet_oos) = "oos",
  }
  ruleset_id = module.hub.ruleset_id
  vnet_id    = module.hub.vnet_id
}

# To Create the Gateway Subnet

module "vnet" {
  source   = "../tfs_azurerm_truth/network"
  location = var.location
}

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

resource "azurerm_private_dns_resolver_virtual_network_link" "example" {
  for_each                  = terraform.workspace == "hub" ? "${local.vnet_id}" : "${local.source_vnet_id}"
  name                      = terraform.workspace == "hub" ? "tfs-dns-rule-link-${terraform.workspace}-${local.region}-speech" : "tfs-dns-rule-link-${terraform.workspace}-${each.value}-${local.region}-speech"
  dns_forwarding_ruleset_id = local.ruleset_id
  virtual_network_id        = terraform.workspace == "hub" ? "${local.vnet_id}" : "${each.key}"
}
