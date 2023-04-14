instance_config = {
  component                        = "testzone"
  vm_count                         = 5
  enable_proximity_placement_group = false
  data_disk_name = {
    disk1 = {
      name                 = "01"
      disk_size_gb         = "32"
      lun                  = "10"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
  }
  tags = {
    terraform     = "1"
    environment   = "dev"
    project_owner = "speech"
  }
  alt_datacenter = "west"
  datacenter     = "east"
  dns_name       = "dev-testzone01.speech.dev.east.azcloud.247-inc.net"
  environment    = "dev"
  az_alt_region  = "westus"
  az_region      = "eastus"
  az_zone        = "1"
  instance_name  = "testzone"
  network_type   = "oos-app"
  number1        = 1
  prefix         = "dev"
  release_type   = "speech.testzone"
}

principal_id = {
  "p1" = "432614a8-4eae-4aa4-81b0-09a8433aa5bc"
}
