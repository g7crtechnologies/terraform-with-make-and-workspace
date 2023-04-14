output "fw_name" {
  value = data.terraform_remote_state.firewall.outputs.fw_name
}

output "fw_pip" {
  value = data.terraform_remote_state.firewall.outputs.fw_pip
}

output "fw_policy_id" {
  value = data.terraform_remote_state.firewall.outputs.fw_policy_id
}

#------------------------------------------
# Remote State file for Subnet
#------------------------------------------
data "terraform_remote_state" "firewall" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/firewall/hub/default.tfstateenv:hub"
  }
}