locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  key_vault_id_hub    = terraform.workspace == "hub" ? element(module.hub.0.key_vault_id ,0) : null
  key_vault_id        = terraform.workspace == "hub" ? null : element(module.env.0.key_vault_id ,0)
  loc_prefix          = var.location == "eastus" ? "east" : "west"
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

module "hub" {
  count    = terraform.workspace == "hub" ? 1 : 0
  source   = "../tfs_azurerm_truth/keyvault"
  location = var.location
}

module "env" {
  count    = terraform.workspace == "hub" ? 0 : 1
  source   = "../tfs_azurerm_truth/keyvault"
  location = var.location
}

data "azurerm_client_config" "current" {}

data "azurerm_ssh_public_key" "ssh_key" {
  for_each            = var.ssh_key_map[terraform.workspace]
  name                = each.value.ssh_key_name
  resource_group_name = each.value.ssh_key_rg_name
}

resource "azurerm_key_vault_secret" "ssh_key" {
  for_each     = var.ssh_key_map[terraform.workspace]
  name         = "tfs-secret-${terraform.workspace}-${local.loc_prefix}"
  value        = var.secret_value
  key_vault_id = terraform.workspace == "hub" ? local.key_vault_id_hub : local.key_vault_id
  tags         = var.tags[terraform.workspace]
}
