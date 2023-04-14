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
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "${local.environment}/vnet/hub/default.tfstateenv:hub"
  }
}
#------------------------------------------
# Output of subnets
#------------------------------------------

### hub subnet id
output "mgmt" {
  value = data.terraform_remote_state.subnet.outputs.mgmt
}
output "lb" {
  value = data.terraform_remote_state.subnet.outputs.lb
}

variable "location" {
  type        = string
  description = "location of resources"
}

output "subnet_ids" {
  value = data.terraform_remote_state.subnet.outputs.subnet_ids
}


