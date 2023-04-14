locals {
  location            = var.location == "eastus" ? "eu" : "wu"
  resource_group_name = module.rg.rg_name
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

data "azurerm_virtual_network" "vnet" {
  for_each            = var.LbRules
  name                = each.value.vnet_name
  resource_group_name = local.resource_group_name
}

data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = local.resource_group_name
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  for_each        = var.LbRules
  name            = "${var.prefix}-${terraform.workspace}-${each.value["pci"]}-${local.location}-bckpool${each.value["Id"]}"
  loadbalancer_id = data.azurerm_lb.lb.id
}

resource "azurerm_lb_probe" "lb_probe" {
  for_each        = var.LbRules
  name            = "${var.prefix}-${terraform.workspace}-${each.value["pci"]}-${local.location}-probe-${each.value["Id"]}"
  port            = each.value["probe_port"]
  protocol        = each.value["probe_protocol"]
  request_path    = each.value["probe_protocol"] == "Tcp" ? "" : each.value["request_path"]
  loadbalancer_id = data.azurerm_lb.lb.id
}

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.LbRules
  name                           = "${var.prefix}-${terraform.workspace}-${local.location}-rule-${each.value["Id"]}"
  protocol                       = "Tcp"
  frontend_port                  = each.value["lb_port"]
  backend_port                   = each.value["backend_port"]
  frontend_ip_configuration_name = data.azurerm_lb.lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend[each.key].id]
  probe_id                       = lookup(azurerm_lb_probe.lb_probe, each.key)["id"]
  load_distribution              = each.value["load_distribution"]
  idle_timeout_in_minutes        = 4
  loadbalancer_id                = data.azurerm_lb.lb.id
}

output "backend_id" {
  value = [for i in azurerm_lb_backend_address_pool.lb_backend : i.id]
}

locals {
  backend_id = [for i in azurerm_lb_backend_address_pool.lb_backend : i.id]
}

output "frontend_ip_configuration_name" {
  value = [for i in data.azurerm_lb.lb.frontend_ip_configuration[*] : i.name]
}


data "azurerm_network_interface" "nic" {
  count               = var.nic_name != null ? length(var.nic_name) > 0 ? 1 : 0 : 0
  resource_group_name = var.nic_rg
  name                = var.nic_name[count.index]
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_pool_association" {
  count                   = var.nic_name != null ? length(var.nic_name) > 0 ? 1 : 0 : 0
  network_interface_id    = data.azurerm_network_interface.nic[count.index].id
  ip_configuration_name   = data.azurerm_network_interface.nic[count.index].ip_configuration[0].name
  backend_address_pool_id = element(local.backend_id, 0)
}
