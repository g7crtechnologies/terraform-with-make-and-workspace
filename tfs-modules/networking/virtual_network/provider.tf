terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.29.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.4.3"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id[terraform.workspace]
}
