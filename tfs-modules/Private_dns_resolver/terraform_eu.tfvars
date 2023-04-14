#------------------------------------------
# Variables for East US Region
#------------------------------------------
location                         = "eastus"
inbound_subnet_address_prefixes  = ["10.88.59.0/24"]
outbound_subnet_address_prefixes = ["10.88.60.0/24"]
dns_resolver_name                = "dns-private-resolver"
private_dns_zone_name            = "az-cloud.247-inc.net"
target_domain_name               = "247-inc.net."
target_ip = {
  ip1 = {
    ip_address = "10.65.99.244"
    port = "53"
  }

}
target_ip_gcp = {
  ip1 = {
    ip_address = "10.63.0.62" 
    port = "53"
  }
  ip2 = {
    ip_address = "10.31.0.101"
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
    environment        = "prod"
    finance_allocation = "Engineering"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "dns"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "devops"
  }
  dev = {
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
  qa = {
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
