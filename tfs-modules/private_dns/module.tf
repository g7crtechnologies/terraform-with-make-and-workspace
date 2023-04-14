module "dnsresolver" {
  source                = "../module/tfs_azurerm_private_dns"
  location              = var.location
  private_dns_zone_name = var.private_dns_zone_name
  tags                  = var.tags
}
