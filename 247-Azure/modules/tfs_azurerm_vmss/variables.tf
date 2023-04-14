variable "location" {
  type = string
}

variable "ssh_key_name" {
  type    = string
  default = "tfs-ssh-key"
}

variable "ssh_key_rg_name" {
  type    = string
  default = "tfs-rg-dev-eu-landingzone"
}

variable "subnet_name" {
  type    = string
  default = "tfs-vnet-dev-cde-eu-speech"
}

variable "subnet_rg_name" {
  type    = string
  default = "tfs-rg-dev-eu-landingzone"
}

variable "image_name" {
  type    = string
  default = "tfs-vnet-dev-cde-eu-speech"
}

variable "image_rg" {
  type    = string
  default = "tfs-vnet-dev-cde-eu-speech"
}

variable "image_version" {
  type    = string
  default = "tfs-vnet-dev-cde-eu-speech"
}

variable "gallery_name" {
  type    = string
  default = "tfs-rg-dev-eu-landingzone"
}

variable "subnet_vnet_name" {
  type    = string
  default = "tfs-vnet-dev-cde-eu-speech"
}

variable "vmss_instances" {
  type = map(object({
    name                   = string
    sku                    = string
    instance_count         = number
    username               = string
    auto_repair_enable     = string
    single_placement_group = bool
    caching                = string
    storage_account_type   = string
    disk_size_gb           = string
    overprovision          = bool
    upgrade_mode           = string
    storage_account_uri    = string
    identity_type          = string
    rule                   = string
    data_disk              = any
    subnet_id              = string
  }))
  default = {
    "instance1" = {
      name                   = "my-vmss"
      sku                    = "Standard_B2ms"
      instance_count         = 2
      username               = "adminuser"
      auto_repair_enable     = false
      single_placement_group = true
      caching                = "ReadWrite"
      storage_account_type   = "Standard_LRS"
      disk_size_gb           = "32"
      overprovision          = true
      upgrade_mode           = "Automatic"
      storage_account_uri    = ""
      identity_type          = "SystemAssigned"
      rule                   = "Default"
      data_disk = {
        data_disk_lun                  = 1
        data_disk_caching              = "ReadWrite"
        data_disk_create_option        = "empty"
        data_disk_storage_account_type = "Standard_LRS"
        data_disk_disk_size_gb         = "32"
      }
      subnet_id = ""
    }
  }
  description = "this variable contains all the parameters for vmss"
}

variable "instance_config" {
  description = "See tfs_compute for documentation."
}

variable "backend_id" {
  description = "backend id of loadbalancers"
  type        = list(string)
}

variable "tags" {
  description = "The tags to associate with resources"
  type        = any
  default = {
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
  }
}
