#Variable for West US Region
location = "westus"
sku      = "Standard"
prefix   = "tfs-ilb"
lbs = {
  prod = {
    prod-c2c = {
      name        = "prod-c2c"
      description = "speech"
      subnet_name = "tfs-snet-prod-c2c-lb-wu-speech"
      vnet_name   = "tfs-vnet-prod-c2c-wu-speech"
    }
    prod-cde = {
      name        = "prod-cde"
      description = "speech"
      subnet_name = "tfs-snet-prod-cde-lb-wu-speech"
      vnet_name   = "tfs-vnet-prod-cde-wu-speech"
    }
    prod-oos = {
      name        = "prod-oos"
      description = "speech"
      subnet_name = "tfs-snet-prod-oos-lb-wu-speech"
      vnet_name   = "tfs-vnet-prod-oos-wu-speech"
    }
  }
  hub = {
    hub = {
      name        = "hub"
      description = "speech"
      subnet_name = "tfs-snet-hub-lb-wu-speech"
      vnet_name   = "tfs-vnet-hub-wu-speech"
    }
  }
  psr = {
    psr-c2c = {
      name        = "psr-c2c"
      description = "speech"
      subnet_name = "tfs-snet-psr-c2c-lb-wu-speech"
      vnet_name   = "tfs-vnet-psr-c2c-wu-speech"
    }
    psr-cde = {
      name        = "psr-cde"
      description = "speech"
      subnet_name = "tfs-snet-psr-cde-lb-wu-speech"
      vnet_name   = "tfs-vnet-psr-cde-wu-speech"
    }
    psr-oos = {
      name        = "psr-oos"
      description = "speech"
      subnet_name = "tfs-snet-psr-oos-lb-wu-speech"
      vnet_name   = "tfs-vnet-psr-oos-wu-speech"
    }
  }

  stg = {
    stg-c2c = {
      name        = "stg-c2c"
      description = "speech"
      subnet      = "c2c"
      subnet_name = "tfs-snet-stg-c2c-lb-wu-speech"
      vnet_name   = "tfs-vnet-stg-c2c-wu-speech"
    }
    stg-cde = {
      name        = "stg-cde"
      description = "speech"
      subnet_name = "tfs-snet-stg-cde-lb-wu-speech"
      vnet_name   = "tfs-vnet-stg-cde-wu-speech"
    }
    stg-oos = {
      name        = "stg-oos"
      description = "speech"
      subnet_name = "tfs-snet-stg-oos-lb-wu-speech"
      vnet_name   = "tfs-vnet-stg-oos-wu-speech"
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
