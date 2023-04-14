location = "westus"
vmss_instances = {
  "cde" = {
    name                           = "my-vmss"
    sku                            = "Standard_B2ms"
    instance_count                 = 2
    username                       = "adminuser"
    auto_repair_enable             = false
    single_placement_group         = true
    caching                        = "ReadWrite"
    storage_account_type           = "Standard_LRS"
    disk_size_gb                   = "32"
    overprovision                  = true
    upgrade_mode                   = "Automatic"
    storage_account_uri            = ""
    identity_type                  = "SystemAssigned"
    rule                           = "Default"
    data_disk_lun                  = 1
    data_disk_caching              = "ReadWrite"
    data_disk_create_option        = "empty"
    data_disk_storage_account_type = "Standard_LRS"
    data_disk_disk_size_gb         = "32"
    subnet_id                      = ""
  }
}


ssh_key_name     = "tfs-ssh-key"
ssh_key_rg_name  = "tfs-rg-dev-wu-landingzone"
subnet_name      = "tfs-snet-dev-cde-app-wu-speech"
subnet_rg_name   = "tfs-rg-dev-wu-landingzone"
image_name       = "test-image"
gallery_name     = "final_sig_test"
image_rg         = "tfs-rg-dev-wu-landingzone"
image_version    = "1.0.0"
subnet_vnet_name = "tfs-vnet-dev-cde-wu-speech"
instance_config  = {}
lb_name          = "tfs-ilb-test-eu-speech"
prefix           = "tfs-ilb"
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

