locals {
  resource_group_name = module.rg.rg_name
  loc_prefix          = var.location == "eastus" ? "east" : "west"
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_private_dns_zone" "dns" {
  name                = var.domain_name
  resource_group_name = var.pvt_dns_rg
  provider            = azurerm.hub
}

resource "azurerm_private_dns_a_record" "a_record" {
  provider            = azurerm.hub
  count               = length(var.count_of_vm)
  name                = "${terraform.workspace}.${var.dns_a_record_name}0${count.index + 1}.${var.product}.${terraform.workspace}.${var.location}"
  zone_name           = data.azurerm_private_dns_zone.dns.name
  resource_group_name = data.azurerm_private_dns_zone.dns.resource_group_name
  ttl                 = var.dns_a_record_ttl
  records             = toset(var.count_of_vm[count.index])
}

# resource "azurerm_private_dns_cname_record" "cname_record" {
#   count               = var.count_of_vm
#   name                = "${terraform.workspace}.${var.dns_c_record_name}0${count.index + 1}.${var.product}.${local.loc_prefix}.azcloud.247-inc.net"
#   zone_name           = data.azurerm_private_dns_zone.dns.name
#   resource_group_name = local.resource_group_name
#   ttl                 = var.dns_c_record_ttl
#   record              = var.dns_c_record_records
# }
