output "domain_name" {
  value = azurerm_private_dns_zone.dns.name
}

output "domain_id" {
  value = azurerm_private_dns_zone.dns.id
}