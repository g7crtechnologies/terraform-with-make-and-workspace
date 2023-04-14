#Variable for East US Region
location = "eastus"
sku      = "Standard"
prefix   = "tfs-ilb"
lbs = {
  prod = {
    prod-c2c = {
      name        = "prod-c2c"
      description = "speech"
      subnet_name = "tfs-snet-prod-c2c-lb-eu-speech"
      vnet_name   = "tfs-vnet-prod-c2c-eu-speech"
    }
    prod-cde = {
      name        = "prod-cde"
      description = "speech"
      subnet_name = "tfs-snet-prod-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-prod-cde-eu-speech"
    }
    prod-oos = {
      name        = "prod-oos"
      description = "speech"
      subnet_name = "tfs-snet-prod-oos-lb-eu-speech"
      vnet_name   = "tfs-vnet-prod-oos-eu-speech"
    }
  }
  hub = {
    hub = {
      name        = "hub"
      description = "speech"
      subnet_name = "tfs-snet-hub-lb-eu-speech"
      vnet_name   = "tfs-vnet-hub-eu-speech"
    }
  }
  psr = {
    psr-c2c = {
      name        = "psr-c2c"
      description = "speech"
      subnet_name = "tfs-snet-psr-c2c-lb-eu-speech"
      vnet_name   = "tfs-vnet-psr-c2c-eu-speech"
    }
    psr-cde = {
      name        = "psr-cde"
      description = "speech"
      subnet_name = "tfs-snet-psr-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-psr-cde-eu-speech"
    }
    psr-oos = {
      name        = "psr-oos"
      description = "speech"
      subnet_name = "tfs-snet-psr-oos-lb-eu-speech"
      vnet_name   = "tfs-vnet-psr-oos-eu-speech"
    }
  }

  dev = {
    # dev-c2c = {
    #   name        = "dev-c2c"
    #   description = "speech"
    #   subnet_name = "tfs-snet-dev-c2c-lb-eu-speech"
    #   vnet_name   = "tfs-vnet-dev-c2c-eu-speech"
    # }
    dev-cde = {
      name        = "test"
      description = "speech"
      subnet_name = "tfs-snet-dev-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-dev-cde-eu-speech"
    }
    # dev-oos = {
    #   name        = "dev-oos"
    #   description = "speech"
    #   subnet_name = "tfs-snet-dev-oos-lb-eu-speech"
    #   vnet_name   = "tfs-vnet-dev-oos-eu-speech"
    # }
  }

  qa = {
    qa-c2c = {
      name        = "qa-c2c"
      description = "speech"
      subnet_name = "tfs-snet-qa-c2c-lb-eu-speech"
      vnet_name   = "tfs-vnet-qa-c2c-eu-speech"
    }
    qa-cde = {
      name        = "qa-cde"
      description = "speech"
      subnet_name = "tfs-snet-qa-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-qa-cde-eu-speech"
    }
    qa-oos = {
      name        = "qa-oos"
      description = "speech"
      subnet_name = "tfs-snet-qa-oos-lb-eu-speech"
      vnet_name   = "tfs-vnet-qa-oos-eu-speech"
    }
  }

  stg = {
    stg-c2c = {
      name        = "stg-c2c"
      description = "speech"
      subnet      = "c2c"
      subnet_name = "tfs-snet-stg-c2c-lb-eu-speech"
      vnet_name   = "tfs-vnet-stg-c2c-eu-speech"
    }
    stg-cde = {
      name        = "stg-cde"
      description = "speech"
      subnet_name = "tfs-snet-stg-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-stg-cde-eu-speech"
    }
    stg-oos = {
      name        = "stg-oos"
      description = "speech"
      subnet_name = "tfs-snet-stg-oos-lb-eu-speech"
      vnet_name   = "tfs-vnet-stg-oos-eu-speech"
    }
  }
}
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
