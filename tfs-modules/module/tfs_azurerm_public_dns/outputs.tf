output "public_dns_name" {
  value = azurerm_dns_zone.dns.name
}

output "public_dns_id" {
  value = azurerm_dns_zone.dns.id
}