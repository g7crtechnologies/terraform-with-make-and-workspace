#To call remote State file in different-different block of code
data "terraform_remote_state" "speech-application" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-hub-tfstate"
    storage_account_name = "tfsstghubtfstate"
    container_name       = "tfstate"
    key                  = "mg/products/default.tfstate"
  }
}