#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  environment = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
}

#------------------------------------------
# Remote State file for key vault
#------------------------------------------
data "terraform_remote_state" "kv" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/key_vault/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
  }
}


output "key_vault_id" {
  value = data.terraform_remote_state.kv.outputs.key_vault_id
}

variable "location" {
  type        = string
  description = "location of resources"
}