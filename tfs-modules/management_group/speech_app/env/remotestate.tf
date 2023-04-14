data "terraform_remote_state" "env" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "mg/products/speech-application/default.tfstate"
  }
}

