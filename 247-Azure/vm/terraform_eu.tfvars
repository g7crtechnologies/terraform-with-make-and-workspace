instance_config = {
  component = "salt-test"
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
principal_id = [ "7c4b947d-25ef-46fd-ad99-39fa549587d2" ]