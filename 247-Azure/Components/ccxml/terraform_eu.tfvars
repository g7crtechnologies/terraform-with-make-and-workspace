instance_config = {
  vm_count                         = 2
  network_type                     = "cde-app"
  disk_count                       = 1
  component                        = "ccxml"
  enable_proximity_placement_group = false
  vm_size                          = "Standard_D4as_v4"
  os_disk_size                     = "64"
  tags = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "ccxml"
    network_segment    = "cde"
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
    lb_name           = "tfs-ilb-ccxml-eu-speech"
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
    skey              = "dev"
  }
}

lb_name     = "tfs-ilb-ccxml-eu-speech"
enable_lb   = true
lb_creation = true
lbs = {
  dev = {
    dev-cde = {
      description = "speech"
      name        = "ccxml"
      subnet_name = "tfs-snet-dev-cde-lb-eu-speech"
      vnet_name   = "tfs-vnet-dev-cde-eu-speech"
    }

  }
}

tags = {
  dev = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "ccxml"
    network_segment    = "cde"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}
mount_list = ["/var/tellme"]
pip_count  = null

component = "ccxml"
nsg_name  = "tfs-nsg-dev-cde-app-data-eu-speech"
nic_count = "2"
