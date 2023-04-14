# Local Variables and accepting remote state file for resource group and subnet
locals {
  resource_group_name = module.rg.rg_name
  location            = var.location == "eastus" ? "eu" : "wu"

}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_subnet" "hub" {
  for_each             = var.lbs[terraform.workspace]
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = local.resource_group_name
}

#------------------------------------------
# Load Balancer
#------------------------------------------

resource "azurerm_lb" "lb" {
  for_each            = var.lbs[terraform.workspace]
  name                = "${var.prefix}-${each.value.name}-${local.location}-speech"
  location            = var.location
  resource_group_name = local.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                          = "${var.prefix}-${terraform.workspace}-${each.value.name}-${local.location}-${each.value.description}-fip"
    subnet_id                     = data.azurerm_subnet.hub[each.key].id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags[terraform.workspace]
}

output "lb_id" {
  value = [
    for lb in azurerm_lb.lb : lb.id
  ]
}
output "lb_fip_name" {
  value = [
    for lb in azurerm_lb.lb : lb.name
  ]
}
