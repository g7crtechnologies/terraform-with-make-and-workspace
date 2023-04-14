#To store the tfstate in backend in storage account.
terraform {
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }
} 