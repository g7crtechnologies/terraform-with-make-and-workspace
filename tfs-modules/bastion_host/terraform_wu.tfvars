location    = "westus"
subnet_cidr = "10.128.1.0/24"
sku         = "Basic" // Basic or Standard
scale_units = 2       // Basic = 2 or Standard = 2 to 50
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
    environment        = "hub"
    finance_allocation = "Engineering"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "bastion"
    network_segment    = "hub"
    type_of_appliance  = "bastion"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}