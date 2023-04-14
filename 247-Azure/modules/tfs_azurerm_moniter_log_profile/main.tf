locals {
  stg_acc_id = module.stg.stg_acc_id
  loc_prefix = var.location == "eastus" ? "eu" : "wu"
}

module "stg" {
  source   = "../tfs_azurerm_truth/stg_acc"
  location = var.location
}

resource "azurerm_monitor_log_profile" "profile" {
  for_each           = var.logs_profile
  name               = "tfs-log-pf-${terraform.workspace}-${local.loc_prefix}"
  categories         = each.value.categories
  locations          = each.value.locations
  storage_account_id = tostring(element(local.stg_acc_id, 0))
  retention_policy {
    enabled = each.value.enabled
    days    = each.value.retention_days
  }
}
