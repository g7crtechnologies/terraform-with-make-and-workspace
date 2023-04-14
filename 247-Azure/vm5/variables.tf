variable "instance_config" {
  description = "See tfs_compute for documentation."
  default = {
    // release_type = no default
    vm_count                         = 1
    private_ip_address_alloc         = "Dynamic"
    component                        = "speech"
    location                         = "eastus"
    vm_size                          = "Standard_DS1_v2"
    publisher                        = "OpenLogic"
    offer                            = "CentOS"
    sku                              = "7_9-gen2"
    version                          = "latest"
    enable_proximity_placement_group = true
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
        name                 = "02"
        disk_size_gb         = "32"
        lun                  = "11"
        create_option        = "Empty"
        storage_account_type = "Standard_LRS"
        caching_type         = "ReadWrite"
      }
    }
    vm_availability_zone = ["1"]
    admin_username       = "azureadmin"
    caching_type         = "ReadWrite"
    managed_disk_type    = "Standard_LRS"
    create_option        = "FromImage"
    tags = {
      terraform   = "1"
      environment = "dev"
    }
  }
}

variable "principal_id" {
  description = "list of principal id you want to assign"
  type        = list(string)
  default     = ["432614a8-4eae-4aa4-81b0-09a8433aa5bc"]
}

variable "LbRules" {
  description = "List containing your load balancers parameters."
  type        = any
}
variable "prefix" {
  type        = string
  description = "Prefix applied on the load balancer resources names."
}

variable "location" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "lb_name" {
  type        = string
  description = "Location of the load balancer, use the RG's location if not set"
}

variable "enable_lb" {
  type        = bool
  description = "Location of the load balancer, use the RG's location if not set"
}
