locals {
  resource_group_name = module.rg.rg_name
  location            = var.location
  subnet_id           = var.subnet_id
  vnet_sub_id         = var.subnet_ids
}

module "subnet" {
  source   = "../tfs_azurerm_truth/network"
  location = local.location
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}


resource "azurerm_storage_account" "storageacc" {
  for_each                 = var.env[terraform.workspace]
  name                     = each.value["name"]
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = each.value["account_tier"]
  account_replication_type = each.value["account_replication_type"]
  network_rules {
    virtual_network_subnet_ids = local.vnet_sub_id
    default_action             = "Allow"
  }
  tags = var.tags[terraform.workspace]

}

resource "azurerm_storage_container" "container" {
  for_each              = var.enable_con == true ? var.containers[terraform.workspace] : {}
  name                  = each.value["container_name"]
  storage_account_name  = azurerm_storage_account.storageacc[each.value.storage_key].name
  container_access_type = each.value.container_access_type
}

resource "azurerm_storage_share" "share" {
  for_each             = var.enable_fs == true ? var.fileshare[terraform.workspace] : {}
  name                 = each.value["name"]
  storage_account_name = azurerm_storage_account.storageacc[each.value.storage_key].name
  quota                = each.value["quota"]
}

resource "azurerm_private_endpoint" "endpoint" {
  for_each            = var.enable_pe == true ? var.env[terraform.workspace] : {}
  name                = "tfs-pe-${each.value["name"]}"
  location            = local.location
  resource_group_name = local.resource_group_name
  subnet_id           = local.subnet_id
  tags                = var.tags[terraform.workspace]

  private_service_connection {
    name                           = "tfs-psc-${each.value["name"]}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.storageacc[each.key].id
    subresource_names              = ["blob"]
  }
}
