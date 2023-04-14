#Module for Firewall
module "firewall" {
  source                  = "../module/tfs_azurerm_firewall"
  location                = var.location
  enable_forced_tunneling = var.enable_forced_tunneling
  public_ip_names         = var.public_ip_names
  firewall_subnet         = var.firewall_subnet
  firewall_policy         = var.firewall_policy
  firewall_config = {
    name     = var.firewall_config.name
    sku_name = var.firewall_config.sku_name
    sku_tier = var.firewall_config.sku_tier
  }
  # Adding TAG's to your Azure resources 
  tags = var.tags
}
