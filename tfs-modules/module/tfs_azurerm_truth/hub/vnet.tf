#------------------------------------------
# Remote State file for vnet
#------------------------------------------
data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/vnet/hub/default.tfstateenv:hub"

  }
}

#------------------------------------------
# Output of vnets
#------------------------------------------

# hub vnet name
output "vnet_name" {
  value      = data.terraform_remote_state.vnet.outputs.vnet_name
}

# hub vnet id
output "vnet_id" {
  value = data.terraform_remote_state.vnet.outputs.vnet_id
}
