instance_config = {
  vm_count                         = 2
  network_type                     = "c2c-app"
  disk_count                       = 1
  component                        = "content"
  enable_proximity_placement_group = false
  vm_size                          = "Standard_D2as_v4"
  os_disk_size                     = "64"
  tags = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "content"
    network_segment    = "c2c"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}

principal_id = ["432614a8-4eae-4aa4-81b0-09a8433aa5bc"]
location     = "eastus"
prefix       = "tfs-ilb"

LbRules = {
  lbrules1 = {
    lb_name           = "tfs-ilb-content-eu-speech"
    vnet_name         = "tfs-vnet-dev-c2c-eu-speech"
    pci               = "c2c"
    Id                = "1"   #Id of a the rule within the Load Balancer
    lb_key            = "lb1" #Key of the Load Balancer
    lb_port           = "80"
    probe_port        = "80"
    backend_port      = "80"
    probe_protocol    = "Http"
    request_path      = "/"
    load_distribution = "SourceIPProtocol"
    skey              = "dev"
  }
}

lb_name     = "tfs-ilb-content-eu-speech"
enable_lb   = true
lb_creation = true
lbs = {
  dev = {
    dev-c2c = {
      description = "speech"
      name        = "content"
      subnet_name = "tfs-snet-dev-c2c-lb-eu-speech"
      vnet_name   = "tfs-vnet-dev-c2c-eu-speech"
    }

  }
}

tags = {
  dev = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "telapp"
    network_segment    = "cde"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}

mount_list = ["/var/tellme"]
pip_count  = null