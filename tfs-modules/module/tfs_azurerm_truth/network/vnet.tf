#------------------------------------------
# Remote State file for vnet
#------------------------------------------
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/vnet/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"

  }
}

#------------------------------------------
# Output of vnets
#------------------------------------------

# other env vnet id
output "vnet_c2c" {
  value = data.terraform_remote_state.vnet.outputs.vnet_c2c
}
output "vnet_cde" {
  value = data.terraform_remote_state.vnet.outputs.vnet_cde
}
output "vnet_oos" {
  value = data.terraform_remote_state.vnet.outputs.vnet_oos
}

# other vnets name
output "vnet_c2c_name" {
  value = data.terraform_remote_state.vnet.outputs.vnet_c2c_name
}
output "vnet_cde_name" {
  value = data.terraform_remote_state.vnet.outputs.vnet_cde_name
}
output "vnet_oos_name" {
  value = data.terraform_remote_state.vnet.outputs.vnet_oos_name
}




