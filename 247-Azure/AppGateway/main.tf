module "appgw" {
  source                         = "../modules/tfs_azurerm_appgw"
  location                       = var.location
  pip_name                       = var.pip_name
  appgw_name                     = var.appgw_name
  min_capacity                   = var.min_capacity
  max_capacity                   = var.max_capacity
  gateway_confg                  = var.gateway_confg
  frontend_port_name1            = var.frontend_port_name1
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_name      = var.backend_address_pool_name
  backend_http_settings          = var.backend_http_settings
  http_listener                  = var.http_listener
  request_routing_rule           = var.request_routing_rule
}
