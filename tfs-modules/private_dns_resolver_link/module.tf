module "private_dns_resolver_link" {
  source                = "../module/tfs_azurerm_private_link"
  location              = var.location
}
