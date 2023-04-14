module "cognitive_speech" {
  source              = "../modules/tfs_azurerm_cs"
  location            = var.location
  account_name        = var.account_name
  kind                = var.kind
  sku_name            = var.sku_name
  tags                = var.tags
}

output "endpoint" {
  value = module.cognitive_speech.endpoint
}