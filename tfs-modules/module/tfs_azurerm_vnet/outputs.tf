#Output of each resources 
# hub vnet id

locals {
  hub_con = true
  env_con = false
  env_name = {
    "hub"  = "hub"
    "dev"  = "dev"
    "psr"  = "psr"
    "qa"   = "qa"
    "prod" = "prod"
    "stg"  = "stg"
    "stb"  = "stb"
  }
}

output "vnet_id" {
  value      = "hub" == local.env_name[terraform.workspace] ? local.vnet_id.0 : null
  depends_on = [local.hub_con]
}

# other env vnet id
output "vnet_c2c" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_id.0
  depends_on = [local.env_con]
}
output "vnet_cde" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_id.1
  depends_on = [local.env_con]
}
output "vnet_oos" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_id.2
  depends_on = [local.env_con]
}

# hub vnet name
output "vnet_name" {
  value      = "hub" == local.env_name[terraform.workspace] ? local.vnet_name.0 : null
  depends_on = [local.hub_con]
}

# other vnets name      
output "vnet_c2c_name" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_name.0
  depends_on = [local.env_con]
}
output "vnet_cde_name" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_name.1
  depends_on = [local.env_con]
}
output "vnet_oos_name" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.vnet_name.2
  depends_on = [local.env_con]
}

### hub subnet id
output "mgmt" {
  value      = "hub" == local.env_name[terraform.workspace] ? local.subnet_id.0 : null
  depends_on = [local.hub_con]
}
output "lb" {
  value      = "hub" == local.env_name[terraform.workspace] ? local.subnet_id.1 : null
  depends_on = [local.hub_con]
}

## other vnets subnet id
output "c2c_app" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.0
  depends_on = [local.env_con]
}
output "c2c_app_db" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.1
  depends_on = [local.env_con]
}
output "c2c_lb" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.2
  depends_on = [local.env_con]
}
output "cde_app" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.3
  depends_on = [local.env_con]
}
output "cde_app_db" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.4
  depends_on = [local.env_con]
}
output "cde_lb" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.5
  depends_on = [local.env_con]
}
output "oos_app" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.6
  depends_on = [local.env_con]
}
output "oos_app_db" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.7
  depends_on = [local.env_con]
}
output "oos_lb" {
  value      = "hub" == local.env_name[terraform.workspace] ? null : local.subnet_id.8
  depends_on = [local.env_con]
}

output "subnet_ids" {
  value      = [for key in azurerm_subnet.subnet : key.id]
}