instance_config = {
  vm_count                         = 2
  network_type                     = "cde-app"
  disk_count                       = 1
  component                        = "wcrslsaudioproc"
  enable_proximity_placement_group = false
  vm_size                          = "Standard_D2as_v4"
  os_disk_size                     = "64"
  tags = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "wcrslsaudioproc"
    network_segment    = "cde"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}

principal_id = ["432614a8-4eae-4aa4-81b0-09a8433aa5bc"]
mount_list   = ["/var/tellme"]
pip_count    = null
location     = "eastus"
