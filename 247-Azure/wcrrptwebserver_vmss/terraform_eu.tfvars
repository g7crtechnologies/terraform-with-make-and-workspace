location = "eastus"
vmss_instances = {
  "cde" = {
    name                   = "01"
    sku                    = "Standard_D2as_v4"
    instance_count         = 2
    username               = "azureadmin"
    auto_repair_enable     = false
    single_placement_group = true
    caching                = "ReadWrite"
    storage_account_type   = "StandardSSD_LRS"
    disk_size_gb           = "32"
    overprovision          = true
    upgrade_mode           = "Automatic"
    storage_account_uri    = ""
    identity_type          = "SystemAssigned"
    rule                   = "Default"
    data_disk = {
      2 = {
        data_disk_lun                  = 1
        data_disk_caching              = "ReadWrite"
        data_disk_create_option        = "Empty"
        data_disk_storage_account_type = "StandardSSD_LRS"
        data_disk_disk_size_gb         = "100"
      }
    }
    data_disk_lun                  = 1
    data_disk_caching              = "ReadWrite"
    data_disk_create_option        = "Empty"
    data_disk_storage_account_type = "StandardSSD_LRS"
    data_disk_disk_size_gb         = "100"
    subnet_id                      = ""
  }
}

instance_config = {
  // release_type = no default
  vm_count                         = 1
  product                          = "speech"
  private_ip_address_alloc         = "Dynamic"
  component                        = "speech"
  location                         = "eastus"
  vm_size                          = "Standard_DS1_v2"
  publisher                        = "OpenLogic"
  offer                            = "CentOS"
  sku                              = "7_9-gen2"
  version                          = "latest"
  enable_proximity_placement_group = true
  vm_availability_zone             = "1"
  admin_username                   = "azureadmin"
  caching_type                     = "ReadWrite"
  managed_disk_type                = "Standard_LRS"
  create_option                    = "FromImage"
  alt_datacenter                   = "west"
  datacenter                       = "east"
  dns_name                         = "wcrrptwebserver"
  short_dns_name                   = "speech.dev.east.azcloud.247-inc.net"
  environment                      = "dev"
  az_alt_region                    = "westus"
  az_region                        = "eastus"
  az_zone                          = "1"
  instance_name                    = "wcrrptwebserver"
  network_type                     = "oos-app"
  number1                          = 1
  prefix                           = "dev"
  release_type                     = "speech.wcrrptwebserver"
  ssh_key_name                     = "tfs-ssh-key"
  dns_a_record_ttl                 = "300"
  dns_a_record_records             = ["10.0.180.17"]
  dns_c_record_ttl                 = "300"
  dns_c_record_records             = ["10.0.180.17"]
  domain_name                      = "azcloud.247-inc.net"
  pvt_dns_rg                       = "tfs-rg-hub-eu-landingzone"
  data_disk_name = {
    1 = {
      name                 = "01"
      disk_size_gb         = "32"
      lun                  = "10"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
    2 = {
      name                 = "02"
      disk_size_gb         = "32"
      lun                  = "11"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
  }
  vm_availability_zone = "1"
  admin_username       = "azureadmin"
  caching_type         = "ReadWrite"
  managed_disk_type    = "Standard_LRS"
  create_option        = "FromImage"
  tags = {
    terraform   = "1"
    environment = "dev"
  }
}


ssh_key_name     = "tfs-ssh-key"
ssh_key_rg_name  = "tfs-rg-dev-eu-landingzone"
subnet_name      = "tfs-snet-dev-cde-app-eu-speech"
subnet_rg_name   = "tfs-rg-dev-eu-landingzone"
image_name       = "test-image"
gallery_name     = "final_sig_test"
image_rg         = "tfs-rg-dev-eu-landingzone"
image_version    = "1.0.1"
subnet_vnet_name = "tfs-vnet-dev-cde-eu-speech"
lb_name          = "tfs-ilb-wcrrptwebserver-eu-speech"
prefix           = "tfs-ilb"
LbRules = {
  lbrules1 = {
    lb_name           = "tfs-ilb-wcrrptwebserver-eu-speech"
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
}

lb_creation = true
sku         = "Standard"
lbs = {
  dev = {
    dev-cde = {
      name        = "wcrrptwebserver"
      description = "speech"
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
    product_component  = "wcrrptwebserver"
    network_segment    = "cde"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}
