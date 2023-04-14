module "firewall" {
  source                       = "../modules/tfs_azurerm_firewallrules"
  location                     = var.location
  public_ip_names              = var.public_ip_names
  priority                     = var.priority
  network_rule_collections     = var.network_rule_collections
  network_rules                = var.network_rules
  application_rule_collections = var.application_rule_collections
  app_rules                    = var.app_rules
  nat_rule_collections         = var.nat_rule_collections
  nat_rules                    = var.nat_rules
}
