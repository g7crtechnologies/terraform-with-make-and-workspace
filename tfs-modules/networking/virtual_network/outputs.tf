#------------------------------------------
# Output of each resource
#------------------------------------------
# hub vnet id

output "vnet_id" {
  value = module.vnet.vnet_id
}

# other env vnet id
output "vnet_c2c" {
  value = module.vnet.vnet_c2c
}
output "vnet_cde" {
  value = module.vnet.vnet_cde
}
output "vnet_oos" {
  value = module.vnet.vnet_oos
}



# other vnets name
output "vnet_c2c_name" {
  value = module.vnet.vnet_c2c_name
}
output "vnet_cde_name" {
  value = module.vnet.vnet_cde_name
}
output "vnet_oos_name" {
  value = module.vnet.vnet_oos_name
}

# hub vnet name
output "vnet_name" {
  value = module.vnet.vnet_name
}

### hub subnet id

output "mgmt" {
  value = module.vnet.mgmt
}
output "lb" {
  value = module.vnet.lb
}

## other vnets subnet id
output "c2c_app" {
  value = module.vnet.c2c_app
}
output "c2c_app_db" {
  value = module.vnet.c2c_app_db
}
output "c2c_lb" {
  value = module.vnet.c2c_lb
}
output "cde_app" {
  value = module.vnet.cde_app
}
output "cde_app_db" {
  value = module.vnet.cde_app_db
}
output "cde_lb" {
  value = module.vnet.cde_lb
}
output "oos_app" {
  value = module.vnet.oos_app
}
output "oos_app_db" {
  value = module.vnet.oos_app_db
}
output "oos_lb" {
  value = module.vnet.oos_lb
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}
