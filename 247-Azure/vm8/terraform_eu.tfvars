instance_config = {
  vm_count                         = 2
  component                        = "disk-test-8"
  enable_proximity_placement_group = false
  data_disk_name = [
    {
      name                 = "01"
      disk_size_gb         = "32"
      lun                  = "10"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    },
    {
      name                 = "04"
      disk_size_gb         = "32"
      lun                  = "11"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    },
    {
      name                 = "03"
      disk_size_gb         = "32"
      lun                  = "12"
      create_option        = "Empty"
      storage_account_type = "Standard_LRS"
      caching_type         = "ReadWrite"
    }
  ]
}

principal_id = ["432614a8-4eae-4aa4-81b0-09a8433aa5bc"]
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

lb_name   = "tfs-ilb-test-eu-speech"
enable_lb = false
