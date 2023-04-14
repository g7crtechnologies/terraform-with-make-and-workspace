module "kv_secrets" {
  source       = "../modules/tfs_azurerm_kv_secrets"
  location     = var.location
  ssh_key_map  = var.ssh_key_map
  secret_value = var.secret_value
  tags         = var.tags
}
