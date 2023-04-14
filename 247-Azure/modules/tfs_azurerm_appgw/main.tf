locals {
  resource_group_name = module.rg.rg_name
  subnet_id           = module.hub.mgmt
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  location            = var.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

resource "azurerm_public_ip" "ai" {
  name                = var.pip_name
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# since these variables are re-used - a locals block makes this more maintainable
locals {
  frontend_port_name = "agtestvnet-feport"
}

resource "azurerm_application_gateway" "network" {
  name                = "tfs-appgw-${var.appgw_name}-${local.loc_prefix}"
  resource_group_name = local.resource_group_name
  location            = local.location

  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
  }

  autoscale_configuration {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }
  gateway_ip_configuration {
    name      = var.gateway_confg
    subnet_id = local.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_port {
    name = var.frontend_port_name1
    port = 443
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.ai.id
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  dynamic "backend_http_settings" {
    for_each = var.backend_http_settings
    content {
      name                  = backend_http_settings.value.name
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      path                  = backend_http_settings.value.path
      port                  = backend_http_settings.value.port
      protocol              = backend_http_settings.value.protocol
      request_timeout       = backend_http_settings.value.request_timeout
    }
  }

  dynamic "http_listener" {
    for_each = var.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
    }

  }


  dynamic "request_routing_rule" {
    for_each = var.request_routing_rule
    content {
      name                       = request_routing_rule.value.name
      rule_type                  = request_routing_rule.value.rule_type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      priority                   = request_routing_rule.value.priority
    }

  }
}
