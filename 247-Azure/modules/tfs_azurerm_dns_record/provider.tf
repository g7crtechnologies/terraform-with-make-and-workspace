terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
  }
}
provider "azurerm" {
  features {}
  alias           = "hub"
  subscription_id = "fd2d6291-f998-4e73-95d6-12dc7a0a20c8"
}
