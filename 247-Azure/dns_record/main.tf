module "record" {
  source               = "../modules/tfs_azurerm_dns_record"
  domain_name          = var.domain_name
  dns_a_record_name    = var.dns_a_record_name
  dns_a_record_ttl     = var.dns_a_record_ttl
  dns_a_record_records = var.dns_a_record_records
  dns_c_record_name    = var.dns_c_record_name
  dns_c_record_ttl     = var.dns_c_record_ttl
  dns_c_record_records = var.dns_c_record_records
  location             = var.location
  product              = var.product
  count_of_vm          = var.count_of_vm
  pvt_dns_rg           = var.pvt_dns_rg
}
