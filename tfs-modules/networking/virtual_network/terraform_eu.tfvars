#------------------------------------------
# Variables for East US Region
#------------------------------------------
location                      = "eastus"
region                        = "eu"
disable_bgp_route_propagation = true
tags = {
  prod = {
    environment        = "prod"
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
    environment        = "stg"
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
    environment        = "psr"
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
    environment        = "qa"
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
    environment        = "stb"
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
address_space = {
  prod = {
    prod-c2c = {
      name          = "prod-c2c"
      address_space = ["10.88.16.0/20"]
      product       = "speech"
    }
    prod-cde = {
      name          = "prod-cde"
      address_space = ["10.88.0.0/20"]
      product       = "speech"
    }
    prod-oos = {
      name          = "prod-oos"
      address_space = ["10.88.32.0/20"]
      product       = "speech"
    }
  }
  hub = {
    hub = {
      name          = "hub"
      address_space = ["10.88.48.0/20"]
      product       = "speech"
    }
  }
  psr = {
    psr-c2c = {
      name          = "psr-c2c"
      address_space = ["10.89.80.0/21"]
      product       = "speech"
    }
    psr-cde = {
      name          = "psr-cde"
      address_space = ["10.89.72.0/21"]
      product       = "speech"
    }
    psr-oos = {
      name          = "psr-oos"
      address_space = ["10.89.88.0/21"]
      product       = "speech"
    }
  }

  dev = {
    dev-c2c = {
      name          = "dev-c2c"
      address_space = ["10.89.32.0/21"]
      product       = "speech"
    }
    dev-cde = {
      name          = "dev-cde"
      address_space = ["10.89.24.0/21"]
      product       = "speech"
    }
    dev-oos = {
      name          = "dev-oos"
      address_space = ["10.89.40.0/21"]
      product       = "speech"
    }
  }

  qa = {
    qa-c2c = {
      name          = "qa-c2c"
      address_space = ["10.89.56.0/21"]
      product       = "speech"
    }
    qa-cde = {
      name          = "qa-cde"
      address_space = ["10.89.48.0/21"]
      product       = "speech"
    }
    qa-oos = {
      name          = "qa-oos"
      address_space = ["10.89.64.0/21"]
      product       = "speech"
    }
  }

  stb = {
    stb-c2c = {
      name          = "stb-c2c"
      address_space = ["10.89.104.0/21"]
      product       = "speech"
    }
    stb-cde = {
      name          = "stb-cde"
      address_space = ["10.89.96.0/21"]
      product       = "speech"
    }
    stb-oos = {
      name          = "stb-oos"
      address_space = ["10.89.112.0/21"]
      product       = "speech"
    }
  }

  stg = {
    stg-c2c = {
      name          = "stg-c2c"
      address_space = ["10.89.8.0/21"]
      product       = "speech"
    }
    stg-cde = {
      name          = "stg-cde"
      address_space = ["10.89.0.0/21"]
      product       = "speech"
    }
    stg-oos = {
      name          = "stg-oos"
      address_space = ["10.89.16.0/21"]
      product       = "speech"
    }
  }
}
#================================================================================#

subnet_prefixes = {
  hub = {

    hub-mgmt = {
      name              = "mgmt"
      address_prefixes  = ["10.88.52.0/22"]
      skey              = "hub"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    hub-lb = {
      name              = "lb"
      address_prefixes  = ["10.88.57.0/24"]
      skey              = "hub"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    hub-packer = {
      name              = "packer-image"
      address_prefixes  = ["10.88.61.0/24"]
      skey              = "hub"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }
  prod = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.88.16.0/23"]
      skey              = "prod-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.88.18.0/23"]
      skey              = "prod-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.88.22.0/24"]
      skey              = "prod-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.88.0.0/23"]
      skey              = "prod-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.88.2.0/23"]
      skey              = "prod-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.88.6.0/24"]
      skey              = "prod-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.88.32.0/23"]
      skey              = "prod-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.88.34.0/23"]
      skey              = "prod-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.88.38.0/24"]
      skey              = "prod-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }

  psr = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.89.82.0/23"]
      skey              = "psr-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.84.0/23"]
      skey              = "psr-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.87.0/24"]
      skey              = "psr-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.89.74.0/23"]
      skey              = "psr-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.76.0/23"]
      skey              = "psr-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.79.0/24"]
      skey              = "psr-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.89.90.0/23"]
      skey              = "psr-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.92.0/23"]
      skey              = "psr-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.95.0/24"]
      skey              = "psr-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }

  dev = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.89.34.0/23"]
      skey              = "dev-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.36.0/23"]
      skey              = "dev-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.39.0/24"]
      skey              = "dev-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.89.26.0/23"]
      skey              = "dev-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage", ]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.28.0/23"]
      skey              = "dev-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.31.0/24"]
      skey              = "dev-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.89.42.0/23"]
      skey              = "dev-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.44.0/23"]
      skey              = "dev-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.47.0/24"]
      skey              = "dev-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }

  qa = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.89.58.0/23"]
      skey              = "qa-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.60.0/23"]
      skey              = "qa-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.63.0/24"]
      skey              = "qa-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.89.50.0/23"]
      skey              = "qa-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.52.0/23"]
      skey              = "qa-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.55.0/24"]
      skey              = "qa-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.89.66.0/23"]
      skey              = "qa-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.68.0/23"]
      skey              = "qa-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.71.0/24"]
      skey              = "qa-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }

  stb = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.89.106.0/23"]
      skey              = "stb-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.108.0/23"]
      skey              = "stb-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.111.0/24"]
      skey              = "stb-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.89.98.0/23"]
      skey              = "stb-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.100.0/23"]
      skey              = "stb-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.103.0/24"]
      skey              = "stb-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.89.114.0/23"]
      skey              = "stb-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.116.0/23"]
      skey              = "stb-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.119.0/24"]
      skey              = "stb-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }

  stg = {

    c2c-app = {
      name              = "app"
      address_prefixes  = ["10.89.8.0/23"]
      skey              = "stg-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.10.0/23"]
      skey              = "stg-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    c2c-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.14.0/24"]
      skey              = "stg-c2c"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    cde-app = {
      name              = "app"
      address_prefixes  = ["10.89.0.0/23"]
      skey              = "stg-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.2.0/23"]
      skey              = "stg-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    cde-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.6.0/24"]
      skey              = "stg-cde"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

    oos-app = {
      name              = "app"
      address_prefixes  = ["10.89.16.0/23"]
      skey              = "stg-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-app-data = {
      name              = "app-data"
      address_prefixes  = ["10.89.18.0/23"]
      skey              = "stg-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }
    oos-lb = {
      name              = "lb"
      address_prefixes  = ["10.89.22.0/24"]
      skey              = "stg-oos"
      product           = "speech"
      service_endpoints = ["Microsoft.Storage",]
    }

  }
}

