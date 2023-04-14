terraform {
  backend "azurerm" {
    resource_group_name  = "backend-247"
    storage_account_name = "tfsstgdevtfstate"
    container_name       = "tfstate"
    key                  = "vm/terraform.tfstate"
  }
} 