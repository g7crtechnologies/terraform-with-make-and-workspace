locals {
  loc_prefix = var.location == "eastus" ? "east" : "west"
  location   = var.location
  rg_name    = module.rg.rg_name
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = local.rg_name
}

resource "azurerm_network_interface" "nic" {
  count                         = var.nic_count
  name                          = "tfs-nic-${terraform.workspace}-${local.loc_prefix}-${var.component}-${count.index}-1"
  location                      = local.location
  resource_group_name           = local.rg_name
  enable_accelerated_networking = true
  internal_dns_name_label       = null
  ip_configuration {
    name                          = "tfs-ipcnfg-${terraform.workspace}-${local.loc_prefix}-${var.component}-${count.index}-1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"

  }
  tags = var.tags[terraform.workspace]
}

resource "azurerm_network_interface_security_group_association" "vm" {
  count                     = var.nic_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

output "nic_id" {
  value = [for nic in azurerm_network_interface.nic : nic.id]
}
