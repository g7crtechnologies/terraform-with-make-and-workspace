module "kv" {
  source        = "../modules/tfs_azurerm_kv"
  key_vault_map = var.key_vault_map
  location      = var.location
  tags          = var.tags
}

output "key_vault_id" {
  value = module.kv.key_vault_id
}
