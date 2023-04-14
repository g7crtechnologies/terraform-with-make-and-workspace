module "dnsresolver" {
  source                           = "../module/tfs_azurerm_private_dns_resolver"
  private_dns_zone_name            = var.private_dns_zone_name
  location                         = var.location
  dns_resolver_name                = var.dns_resolver_name
  tags                             = var.tags
  subnet_in                        = var.subnet_in
  subnet_out                       = var.subnet_out
  inbound_subnet_address_prefixes  = var.inbound_subnet_address_prefixes
  outbound_subnet_address_prefixes = var.outbound_subnet_address_prefixes
  dns_resolver_inbound_endpoints   = var.dns_resolver_inbound_endpoints
  dns_resolver_outbound_endpoints  = var.dns_resolver_outbound_endpoints
  target_domain_name               = var.target_domain_name
  target_ip                        = var.target_ip
  forwarding_ruleset_outbound_name = var.forwarding_ruleset_outbound_name
  target_ip_gcp                    = var.target_ip_gcp
}

output "ruleset_id" {
  value = module.dnsresolver.ruleset_id
}
