locals {
  env        = var.location == "eastus" ? "eu" : "wu"
  value      = local.info.vm_count >= "10" ? null : "0"
  rg_name    = module.rg.rg_name
  info       = merge(module.host_info.info, var.instance_config) // info is a map containing various configuration values that will be merged with 
  mount_list = ["/data"]                                         // mount_list is a list of strings indicating the directories that will be mounted.
  files = [                                                      // files is a list of maps containing file details.
    {
      "file_name" : "/tmp/file1.txt",
      "file_content" : "This is the content of file1.txt",
      "file_permissions" : "0o644"
    },
    {
      "file_name" : "/tmp/file2.txt",
      "file_content" : "This is the content of file2.txt",
      "file_permissions" : "0o644"
    },
    {
      "file_name" : "/tmp/file3.txt",
      "file_content" : "This is the content of file3.txt",
      "file_permissions" : "0o644"
    }
  ]
}

# Template file to render the script to mount the data disks.

data "template_file" "datadisk" {
  template = file("${path.module}/templates/datadisk.sh")
  vars = {
    mount_list = jsonencode(local.mount_list)
  }
}

// Template file to render the SaltStack installation script.

data "template_file" "salt" {
  count    = local.info.vm_count
  template = file("${path.module}/templates/salt.sh")
  vars = {
    dns_name       = "${terraform.workspace}-${local.info.instance_name}${local.value}${tostring(count.index + 1)}.${local.info.component}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
    short_dns_name = local.info.short_dns_name
  }
}

// Template file to render the release type JSON file.

data "template_file" "release_type" {
  count    = local.info.vm_count
  template = file("${path.module}/templates/release_type.json")
  vars = {
    alt_datacenter = local.info.alt_datacenter
    datacenter     = local.info.datacenter
    dns_name       = "${terraform.workspace}-${local.info.instance_name}${local.value}${tostring(count.index + 1)}.${local.info.component}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
    environment    = local.info.environment
    az_alt_region  = local.info.az_alt_region
    az_region      = local.info.az_region
    az_zone        = local.info.az_zone
    instance_name  = "${local.info.instance_name}-${tostring(count.index + 1)}"
    network_type   = local.info.network_type
    number         = "${tostring(count.index + 1)}"
    prefix         = local.info.prefix
    release_type   = local.info.release_type
  }
}

# Importing modules of the host_info, rg and vnet

module "host_info" {
  source = "./host_info"
}

module "vnet" {
  source   = "../tfs_azurerm_truth/network"
  location = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_shared_image_version" "image" {
  image_name          = var.image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.image_rg
  name                = var.image_version
}

data "azurerm_ssh_public_key" "key" {
  name                = var.ssh_key_name
  resource_group_name = var.ssh_key_rg_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_rg_name
  virtual_network_name = var.subnet_vnet_name
}

resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each                        = var.vmss_instances
  name                            = "${terraform.workspace}-${local.info.instance_name}${each.value.name}.${local.info.component}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
  location                        = var.location
  admin_username                  = each.value.username
  resource_group_name             = local.rg_name
  sku                             = each.value.sku
  instances                       = each.value.instance_count
  single_placement_group          = each.value.single_placement_group
  overprovision                   = each.value.overprovision
  upgrade_mode                    = each.value.upgrade_mode
  disable_password_authentication = true
  source_image_id                 = data.azurerm_shared_image_version.image.id
  computer_name_prefix            = "${terraform.workspace}-${local.info.instance_name}${each.value.name}.${local.info.component}.${terraform.workspace}.${local.info.location}"

  custom_data = base64encode(join("", [
    file("${path.module}/scripts/activateme.sh"),
    data.template_file.salt[0].rendered,
    data.template_file.datadisk.rendered
  ]))

  user_data = base64encode(join("", [data.template_file.release_type[0].rendered]))
  admin_ssh_key {
    username   = each.value.username
    public_key = data.azurerm_ssh_public_key.key.public_key
  }

  automatic_instance_repair {
    enabled      = each.value.auto_repair_enable
    grace_period = "PT30M"
  }

  identity {
    type = each.value.identity_type
  }

  boot_diagnostics {
    storage_account_uri = each.value.storage_account_uri
  }

  network_interface {
    name    = "tfs-nic-${each.key}-${local.env}-speech"
    primary = true

    ip_configuration {
      name                                   = "tfs-ip-config-vmss-${each.value.name}-${local.env}-speech"
      subnet_id                              = data.azurerm_subnet.subnet.id
      load_balancer_backend_address_pool_ids = var.backend_id
      primary                                = true
    }
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
    disk_size_gb         = each.value.disk_size_gb
  }

  dynamic "data_disk" {
    for_each = each.value.data_disk
    content {
      lun                  = data_disk.value.data_disk_lun
      caching              = data_disk.value.data_disk_caching
      create_option        = data_disk.value.data_disk_create_option
      storage_account_type = data_disk.value.data_disk_storage_account_type
      disk_size_gb         = data_disk.value.data_disk_disk_size_gb
    }
  }

  scale_in {
    rule = each.value.rule
  }

  # source_image_reference {
  #   publisher = local.info.publisher
  #   offer     = local.info.offer
  #   sku       = local.info.sku
  #   version   = local.info.version
  # }
  
  tags = var.tags[terraform.workspace]

}
