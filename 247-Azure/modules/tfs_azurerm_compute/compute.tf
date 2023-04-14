#This Terraform code is creating Azure resources for deploying virtual machines with attached data disks.
#The code creates a proximity placement group, network interface, public IP address, managed disk, and virtual machine data disk attachment resources.
#It uses variables and local blocks to define #values for the resources. The code also creates data sources for template files and cloud-init configurations.
#The template files include shell #scripts and JSON files, while the cloud-init configuration includes the metadata for a virtual machine.

locals {
  subnet_id      = var.subnet_id
  rg_name        = module.rg.rg_name
  loc_prefix     = local.info.location == "eastus" ? "east" : "west" // loc_prefix is a string that indicates the location prefix based on the location.
  info           = merge(module.host_info.info, var.instance_config) // info is a map containing various configuration values that will be merged with 
  fileshare_name = var.fileshare_name
  value          = local.info.vm_count >= "10" ? null : "0"
  mount_list     = var.mount_list // mount_list is a list of strings indicating the directories that will be mounted.
  files = [                       // files is a list of maps containing file details.
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
    dns_name       = "${terraform.workspace}-${local.info.component}${local.value}${tostring(count.index + 1)}.${local.info.product}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
    short_dns_name = local.info.short_dns_name
  }
}

// Template file to render the release type JSON file.

data "template_file" "release_type" {
  count    = local.info.vm_count
  template = file("${path.module}/templates/release_type.json")
  vars = {
    alt_datacenter = local.loc_prefix == "east" ? "west" : "east"
    datacenter     = local.loc_prefix
    dns_name       = "${terraform.workspace}-${local.info.component}${local.value}${tostring(count.index + 1)}.${local.info.product}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
    environment    = "${terraform.workspace}"
    az_alt_region  = local.info.location == "eastus" ? "westus" : "eastus"
    az_region      = local.info.location
    az_zone        = (count.index % 3) + 1
    instance_name  = "${local.info.component}${local.value}${tostring(count.index + 1)}"
    network_type   = local.info.network_type
    number         = "${tostring(count.index + 1)}"
    prefix         = "${terraform.workspace}"
    release_type   = "${local.info.product}.${local.info.component}"
    fileshare_name = "${join(" ", var.fileshare_name)}"
  }
}

# Importing modules of the host_info, rg and vnet

module "host_info" {
  source = "./host_info"
}
module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = local.info.location
}
module "vnet" {
  source   = "../tfs_azurerm_truth/network"
  location = local.info.location
}
# Getting the public SSH key from the azure
data "azurerm_ssh_public_key" "ssh_key" {
  resource_group_name = local.rg_name
  name                = local.info.ssh_key_name
}

# Creating a proximity placement group for the virtual machines, if enabled in the host_info module. It will be created one for each component and all the instances will be in that
resource "azurerm_proximity_placement_group" "appgrp" {
  count               = local.info.enable_proximity_placement_group == true ? 1 : 0
  name                = lower("tfs-proxigrp-${terraform.workspace}-${local.loc_prefix}-${local.info.component}")
  resource_group_name = local.rg_name
  location            = local.info.location
  tags                = local.info.tags
}

# Creating the network interface cards for the virtual machines
resource "azurerm_network_interface" "nic" {
  count                         = local.info.vm_count
  name                          = "tfs-nic-${terraform.workspace}-${local.loc_prefix}-${local.info.component}-${count.index}"
  location                      = local.info.location
  resource_group_name           = local.rg_name
  enable_accelerated_networking = true
  internal_dns_name_label       = null
  ip_configuration {
    name                          = "tfs-ipcnfg-${terraform.workspace}-${local.loc_prefix}-${local.info.component}-${count.index}"
    subnet_id                     = local.subnet_id
    private_ip_address_allocation = local.info.private_ip_address_alloc
    public_ip_address_id          = var.pip_count == null ? null : count.index < var.pip_count ? azurerm_public_ip.pip[count.index % var.pip_count].id : null
  }
  tags = local.info.tags
}

# Creating the public IP addresses for the virtual machines, which we will removed after testing

resource "azurerm_public_ip" "pip" {
  count               = var.enable_pip == true ? var.pip_count : 0 // for var.pip_count value should be equal to the vm_count
  name                = "tfs-pip-${terraform.workspace}-${local.loc_prefix}-${local.info.component}-${count.index}"
  resource_group_name = local.rg_name
  location            = local.info.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.info.tags
}

data "azurerm_managed_disk" "existing_disk" {
  count               = local.info.vm_count * local.info.disk_count
  name                = "tfs-datadisk-${terraform.workspace}-${local.loc_prefix}-${local.info.component}-vm-${floor(count.index / local.info.disk_count) + 1}-disk-${count.index % local.info.disk_count + 1}"
  resource_group_name = local.rg_name
}

# Attach the data disks to the virtual machines
resource "azurerm_virtual_machine_data_disk_attachment" "vm" {
  count              = local.info.vm_count * local.info.disk_count
  managed_disk_id    = data.azurerm_managed_disk.existing_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[floor(count.index / local.info.disk_count)].id
  #virtual_machine_id = count.index < local.info.disk_count ? azurerm_linux_virtual_machine.vm[floor(count.index / local.info.vm_count)].id : azurerm_linux_virtual_machine.vm[floor(count.index / (local.info.disk_count ))].id
  lun        = local.info.data_disk_name[count.index % local.info.disk_count]["lun"]
  caching    = local.info.data_disk_name[count.index % local.info.disk_count]["caching_type"]
  depends_on = [data.azurerm_managed_disk.existing_disk, azurerm_linux_virtual_machine.vm]
}

# Creation of the VM
resource "azurerm_linux_virtual_machine" "vm" {
  count               = local.info.vm_count
  name                = "${terraform.workspace}-${local.info.component}${local.value}${tostring(count.index + 1)}.${local.info.product}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"
  resource_group_name = local.rg_name
  location            = local.info.location
  size                = local.info.vm_size
  admin_username      = local.info.admin_username
  user_data           = base64encode(join("", [data.template_file.release_type[count.index].rendered]))
  computer_name       = "${terraform.workspace}-${local.info.component}${local.value}${tostring(count.index + 1)}.${local.info.product}.${terraform.workspace}.${local.info.location}.azcloud.247-inc.net"

  # It will be running the scripts in the order of activateme, salt minion installation and data disk mounting
  custom_data = base64encode(join("", [
    file("${path.module}/scripts/activateme.sh"),
    data.template_file.salt[count.index].rendered,
    data.template_file.datadisk.rendered
  ]))
  proximity_placement_group_id = local.info.enable_proximity_placement_group == true ? azurerm_proximity_placement_group.appgrp.0.id : null
  zone                         = (count.index % 3) + 1 # cycle between 1, 2, and 3 for each group of three VMs
  tags                         = local.info.tags
  identity {
    type = "SystemAssigned"
  }
  network_interface_ids = var.increase_nic == true ? [azurerm_network_interface.nic[count.index].id, element(var.nic_id, count.index)] : [azurerm_network_interface.nic[count.index].id]
  admin_ssh_key {
    username   = local.info.admin_username
    public_key = data.azurerm_ssh_public_key.ssh_key.public_key
  }
  disable_password_authentication = true
  boot_diagnostics {}
  os_disk {
    caching              = local.info.caching_type
    storage_account_type = local.info.managed_disk_type
    disk_size_gb         = local.info.os_disk_size
  }
  source_image_reference {
    publisher = local.info.publisher
    offer     = local.info.offer
    sku       = local.info.sku
    version   = local.info.version
  }
}

# Extension creation for the vm to login using Active Directory user
resource "azurerm_virtual_machine_extension" "linuxlogin" {
  count                = local.info.vm_count
  name                 = "AADSSHLoginForLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm[count.index].id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADSSHLoginForLinux"
  type_handler_version = "1.0"
  tags                 = local.info.tags
  depends_on = [
    data.azurerm_managed_disk.existing_disk, azurerm_virtual_machine_data_disk_attachment.vm
  ]
}

#Assigning user the role on the VM to login using AD user
module "role_assignment" {
  count                    = local.info.vm_count
  source                   = "./iam_roles"
  location                 = local.info.location
  principal_id             = var.principal_id
  scope                    = local.scope_id[count.index]
  subcription_scope_enable = false
}

module "record" {
  source               = "../tfs_azurerm_dns_record"
  domain_name          = local.info.domain_name
  dns_a_record_name    = local.info.component
  product              = local.info.product
  dns_a_record_ttl     = local.info.dns_a_record_ttl
  dns_a_record_records = tolist(azurerm_network_interface.nic.*.private_ip_address)
  dns_c_record_name    = local.info.component
  dns_c_record_ttl     = local.info.dns_c_record_ttl
  dns_c_record_records = local.info.dns_c_record_records
  location             = local.info.location
  count_of_vm          = [for ip in azurerm_network_interface.nic.*.private_ip_address : formatlist("%s", ip)]
  pvt_dns_rg           = local.info.pvt_dns_rg
}

locals {
  nic_id   = [for nic in azurerm_network_interface.nic : nic.id]
  scope_id = [for scope in azurerm_linux_virtual_machine.vm : scope.id]
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_pool_association" {
  count                   = var.enable_lb == true ? local.info.vm_count : 0
  network_interface_id    = local.nic_id[count.index]
  ip_configuration_name   = azurerm_network_interface.nic[count.index].ip_configuration[0].name
  backend_address_pool_id = element(var.backend_id, 0)
}
