locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vault_map[terraform.workspace]
  name                        = "tfs-kv-${each.value.name}-speech"
  location                    = local.location
  resource_group_name         = local.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = each.value.sku
  tags                        = var.tags[terraform.workspace]

  access_policy {
    tenant_id           = data.azurerm_client_config.current.tenant_id
    object_id           = data.azurerm_client_config.current.object_id
    key_permissions     = each.value.key_per
    secret_permissions  = each.value.secret_per
    storage_permissions = each.value.storage_per
  }
}

output "key_vault_id" {
  value = [for id in azurerm_key_vault.kv : id.id]
}
