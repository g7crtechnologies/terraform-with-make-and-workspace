locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  vnet_name           = module.hub.vnet_name
  vnet_id             = module.hub.vnet_id
  region              = var.location == "eastus" ? "eu" : "wu"
  domain_name         = module.hub.domain_name
}

# To Create the Gateway Subnet

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}
# Creating Inbound Subnet, note there is only support for two inbound endpoints per DNS Resolver, and they cannot share the same subnet.

resource "azurerm_subnet" "inbound" {
  name                 = lower("tfs-snet-${terraform.workspace}-${var.subnet_in}-${local.region}-speech")
  virtual_network_name = local.vnet_name
  resource_group_name  = local.resource_group_name
  address_prefixes     = var.inbound_subnet_address_prefixes
  delegation {
    name = "Microsoft.Network.Networs.dnsResolvers"
    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
      name = "Microsoft.Network/dnsResolvers"
    }
  }
}

# Creating Outbound Subnet, note there is only support for two outbound endpoints per DNS Resolver, and they cannot share the same subnet.
resource "azurerm_subnet" "outbound" {
  name                 = lower("tfs-snet-${terraform.workspace}-${var.subnet_out}-${local.region}-speech")
  virtual_network_name = local.vnet_name
  resource_group_name  = local.resource_group_name
  address_prefixes     = var.outbound_subnet_address_prefixes
  delegation {
    name = "Microsoft.Network.Networs.dnsResolvers"
    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
      name = "Microsoft.Network/dnsResolvers"
    }
  }
}

#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg_in" {
  name                = "tfs-nsg-${terraform.workspace}-${local.region}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.inbound
  ]
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg_in" {
  network_security_group_id = azurerm_network_security_group.nsg_in.id
  subnet_id                 = azurerm_subnet.inbound.id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.inbound
  ]
}
#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table_in" {
  name                = "tfs-rt-${terraform.workspace}-${local.region}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.inbound
  ]
  tags = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt_in" {
  route_table_id = azurerm_route_table.route_table_in.id
  subnet_id      = azurerm_subnet.inbound.id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.inbound
  ]
}

#------------------------------------------
# NSGs
#------------------------------------------

resource "azurerm_network_security_group" "nsg" {
  name                = "tfs-nsg-${terraform.workspace}-${local.region}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.outbound
  ]
  tags = var.tags[terraform.workspace]
}

#------------------------------------------
# Subnets with NSGs
#------------------------------------------

resource "azurerm_subnet_network_security_group_association" "sub_nsg" {
  network_security_group_id = azurerm_network_security_group.nsg.id
  subnet_id                 = azurerm_subnet.outbound.id
  depends_on = [
    azurerm_network_security_group.nsg, azurerm_subnet.outbound
  ]
}
#------------------------------------------
# Route Tables
#------------------------------------------

resource "azurerm_route_table" "route_table" {
  name                = "tfs-rt-${terraform.workspace}-${local.region}-speech"
  resource_group_name = local.resource_group_name
  location            = local.location
  depends_on = [
    azurerm_subnet.outbound
  ]
  tags = var.tags[terraform.workspace]
}
#------------------------------------------
# Subnets with Route Tables
#------------------------------------------

resource "azurerm_subnet_route_table_association" "sub_rt" {
  route_table_id = azurerm_route_table.route_table.id
  subnet_id      = azurerm_subnet.outbound.id
  depends_on = [
    azurerm_route_table.route_table, azurerm_subnet.outbound
  ]
}

resource "azurerm_private_dns_resolver" "private_dns_resolver" {
  name                = "tfs-${var.dns_resolver_name}-${terraform.workspace}-${local.region}-speech"
  resource_group_name = local.resource_group_name
  location            = var.location
  virtual_network_id  = local.vnet_id
  tags                = var.tags[terraform.workspace]
}

resource "azurerm_private_dns_resolver_inbound_endpoint" "inbound_endpoint" {
  name                    = var.dns_resolver_inbound_endpoints
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver.id
  location                = var.location
  tags                    = var.tags[terraform.workspace]

  ip_configurations {
    private_ip_allocation_method = "Dynamic" # Dynamic is default and only supported.
    subnet_id                    = azurerm_subnet.inbound.id
  }
  depends_on = [
    azurerm_private_dns_resolver.private_dns_resolver, azurerm_subnet.inbound
  ]
}

resource "azurerm_private_dns_resolver_outbound_endpoint" "outbound_endpoint" {
  name                    = var.dns_resolver_outbound_endpoints
  private_dns_resolver_id = azurerm_private_dns_resolver.private_dns_resolver.id
  location                = var.location
  subnet_id               = azurerm_subnet.outbound.id
  tags                    = var.tags[terraform.workspace]
  depends_on = [
    azurerm_private_dns_resolver.private_dns_resolver, azurerm_subnet.outbound
  ]
}

resource "azurerm_private_dns_resolver_forwarding_rule" "azure_to_dc" {
  name                      = "azure_to_dc"
  domain_name               = var.target_domain_name
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound.id

  dynamic "target_dns_servers" {
    for_each = var.target_ip
    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }

  depends_on = [
    azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound
  ]
}

resource "azurerm_private_dns_resolver_forwarding_rule" "azure_to_gcp" {
  name                      = "azure_to_gcp"
  domain_name               = "247-inc.net."
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound.id

  dynamic "target_dns_servers" {
    for_each = var.target_ip_gcp
    content {
      ip_address = target_dns_servers.value.ip_address
      port       = target_dns_servers.value.port
    }
  }

  depends_on = [
    azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound
  ]
}

resource "azurerm_private_dns_resolver_forwarding_rule" "dc_to_azure" {
  name                      = "dc_to_azure"
  domain_name               = "${local.domain_name}."
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound.id
  target_dns_servers {
    ip_address = azurerm_private_dns_resolver_inbound_endpoint.inbound_endpoint.ip_configurations.0.private_ip_address
    port       = 53
  }
  depends_on = [
    azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound
  ]
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "forwarding_ruleset_outbound" {
  name                                       = "tfs-dns-fw-${var.forwarding_ruleset_outbound_name}-${terraform.workspace}-${local.region}-speech"
  resource_group_name                        = local.resource_group_name
  location                                   = var.location
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.outbound_endpoint.id]
  tags                                       = var.tags[terraform.workspace]
  depends_on = [
    azurerm_private_dns_resolver_outbound_endpoint.outbound_endpoint
  ]
}

output "ruleset_id" {
  value = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_ruleset_outbound.id
}
