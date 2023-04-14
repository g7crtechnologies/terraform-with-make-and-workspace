#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#------------------------------------------
# Remote State file for Resource Group
#------------------------------------------
data "terraform_remote_state" "policy_def" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/custom_role_definition/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"

  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------

output "def_id" {
  value       = data.terraform_remote_state.policy_def.outputs.def_id
  description = "resoucrce group name output for remotstate call"
}

variable "location" {
  type        = string
  description = "location of resources"
}
