module "dns" {
  source        = "../module/tfs_azurerm_public_dns"
  location      = var.location
  dns_zone_name = var.dns_zone_name
  tags          = var.tags
}
