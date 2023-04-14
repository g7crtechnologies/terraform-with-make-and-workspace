module "bastion" {
  source      = "../module/tfs_azurerm_bastion_host"
  location    = var.location
  scale_units = var.scale_units
  sku         = var.sku
  subnet_cidr = var.subnet_cidr
  tags        = var.tags
}
output "bastion_subnet_id" {
  value = module.bastion.bastion_subnet_id
}
