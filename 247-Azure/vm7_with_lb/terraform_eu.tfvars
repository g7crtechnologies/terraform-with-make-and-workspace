instance_config = {
  vm_count                         = 2
  private_ip_address_alloc         = "Dynamic"
  component                        = "speech"
  location                         = "eastus"
  vm_size                          = "Standard_DS1_v2"
  publisher                        = "OpenLogic"
  offer                            = "CentOS"
  sku                              = "7_9-gen2"
  version                          = "latest"
  enable_proximity_placement_group = false
  vm_availability_zone             = "1"
  admin_username                   = "azureadmin"
  caching_type                     = "ReadWrite"
  managed_disk_type                = "Standard_LRS"
  create_option                    = "FromImage"
  tags = {
    environment = "value"
    terraform   = "value"
  }
  data_disk_name = {
    disk1 = {
      name                 = "01"
      disk_size_gb         = "32"
      lun                  = "10"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
    disk2 = {
      name                 = "04"
      disk_size_gb         = "32"
      lun                  = "11"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
    disk3 = {
      name                 = "03"
      disk_size_gb         = "32"
      lun                  = "12"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
  }
}

principal_id = ["432614a8-4eae-4aa4-81b0-09a8433aa5bc"]
lb_name      = "tfs-ilb-test-eu-speech"
location     = "eastus"
prefix       = "tfs-ilb"
LbRules = {
  lbrules1 = {
    lb_name           = "tfs-ilb-test-eu-speech"
    vnet_name         = "tfs-vnet-dev-cde-eu-speech"
    pci               = "cde"
    Id                = "1"   #Id of a the rule within the Load Balancer
    lb_key            = "lb1" #Key of the Load Balancer
    lb_port           = "80"
    probe_port        = "80"
    backend_port      = "80"
    probe_protocol    = "Http"
    request_path      = "/"
    load_distribution = "SourceIPProtocol"
    skey              = "hub"
  }
  lbrules2 = {
    lb_name           = "tfs-ilb-test-eu-speech"
    vnet_name         = "tfs-vnet-dev-cde-eu-speech"
    pci               = "cde"
    Id                = "2"   #Id of a the rule within the Load Balancer
    lb_key            = "lb2" #Key of the Load Balancer
    lb_port           = "88"
    probe_port        = "88"
    backend_port      = "88"
    probe_protocol    = "Http"
    request_path      = "/"
    load_distribution = "SourceIPProtocol"
    skey              = "hub"
  }
}

lb_creation = false
#Variable for East US Region
sku = "Standard"
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
      name        = "dev-cde"
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
