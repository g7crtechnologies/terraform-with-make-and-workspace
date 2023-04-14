module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

locals {
  loc_prefix = var.location == "eastus" ? "eu" : "wu"
}
resource "azurerm_cognitive_account" "cognitive" {
  name                = "tfs-cs-${terraform.workspace}-${local.loc_prefix}-speech"
  location            = var.location
  resource_group_name = module.rg.rg_name
  kind                = var.kind
  sku_name            = var.sku_name
  tags                = var.tags
}

output "endpoint" {
  value = azurerm_cognitive_account.cognitive.endpoint
}
