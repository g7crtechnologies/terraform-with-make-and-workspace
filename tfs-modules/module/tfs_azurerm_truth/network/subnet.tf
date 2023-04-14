
#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#------------------------------------------
# Remote State file for Subnet
#------------------------------------------
data "terraform_remote_state" "subnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/vnet/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"

  }
}
#------------------------------------------
# Output of subnets
#------------------------------------------


## other vnets subnet id
output "c2c_app" {
  value = data.terraform_remote_state.subnet.outputs.c2c_app
}
output "c2c_app_db" {
  value = data.terraform_remote_state.subnet.outputs.c2c_app_db
}
output "c2c_lb" {
  value = data.terraform_remote_state.subnet.outputs.c2c_lb
}
output "cde_app" {
  value = data.terraform_remote_state.subnet.outputs.cde_app
}
output "cde_app_db" {
  value = data.terraform_remote_state.subnet.outputs.cde_app_db
}
output "cde_lb" {
  value = data.terraform_remote_state.subnet.outputs.cde_lb
}
output "oos_app" {
  value = data.terraform_remote_state.subnet.outputs.oos_app
}
output "oos_app_db" {
  value = data.terraform_remote_state.subnet.outputs.oos_app_db
}
output "oos_lb" {
  value = data.terraform_remote_state.subnet.outputs.oos_lb
}

variable "location" {
  type = string
  description = "location of resources"
}




