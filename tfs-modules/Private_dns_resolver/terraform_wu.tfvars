#------------------------------------------
# Variables for East US Region
#------------------------------------------
location                         = "westus"
inbound_subnet_address_prefixes  = ["10.86.59.0/24"]
outbound_subnet_address_prefixes = ["10.86.60.0/24"]
dns_resolver_name                = "dns-private-resolver"
private_dns_zone_name            = "az-cloud.247-inc.net"
target_domain_name               = "247-inc.net."
target_ip = {
  ip1 = {
    ip_address = "value"
    port = "53"
  }
}
target_ip_gcp = {
  ip1 = {
    ip_address = "value"
    port = "53"
  }
  ip2 = {
    ip_address = "value" 
    port = "53"
  }
}
forwarding_ruleset_outbound_name = "ruleset"
subnet_in                        = "dns-inbound"
subnet_out                       = "dns-outbound"
dns_resolver_inbound_endpoints   = "inbound"
dns_resolver_outbound_endpoints  = "outbound"
tags = {
  prod = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "apigee"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
  stg = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "apigee"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
  psr = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "apigee"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
  stb = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "apigee"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
  hub = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "apigee"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}
