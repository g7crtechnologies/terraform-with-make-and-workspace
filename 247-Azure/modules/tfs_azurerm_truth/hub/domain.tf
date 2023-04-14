#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  env = var.location == "eastus" ? "eastus" : "eastus"
}

#------------------------------------------
# Remote State file for Subnet
#------------------------------------------
data "terraform_remote_state" "domain" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.env}/hub/dns_zone/default.tfstateenv:hub"
  }
}

output "domain_name" {
  value = data.terraform_remote_state.domain.outputs.domain_name
}
output "domain_id" {
  value = data.terraform_remote_state.domain.outputs.domain_id
}

data "terraform_remote_state" "dns_ruleset" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.env}/hub/dns/default.tfstateenv:hub"
  }
}

output "ruleset_id" {
  value = data.terraform_remote_state.dns_ruleset.outputs.ruleset_id
}