#------------------------------------------
# Local Varaible
#------------------------------------------
locals {
  rg   = values(azurerm_resource_group.infra)[*].name
}

#------------------------------------------
# Resource Group
#------------------------------------------

resource "azurerm_resource_group" "infra" {
  for_each = var.env[terraform.workspace]
  name     = "tfs-rg-${each.value["name"]}-${var.region}-${each.value["comp_name"]}"
  location = var.location
  tags     = var.tags[terraform.workspace]
}

