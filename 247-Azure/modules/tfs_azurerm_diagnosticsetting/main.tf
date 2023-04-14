locals {
  stg_acc_id = module.stg.stg_acc_id
}

module "stg" {
  source   = "../tfs_azurerm_truth/stg_acc"
  location = var.location
}

data "azurerm_client_config" "current" {}
resource "azurerm_monitor_diagnostic_setting" "diagnostic" {
  name               = "tfs-${var.name}-${terraform.workspace}"
  target_resource_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  storage_account_id = element(local.stg_acc_id, 0)

  dynamic "log" {
    for_each = var.logs

    content {
      category_group = log.value.name
      enabled        = log.value.enabled
      retention_policy {
        enabled = log.value.enabled && log.value.retention_days != null ? true : false
        days    = log.value.enabled ? log.value.retention_days : 0
      }
    }
  }
  #   dynamic "metric" {
  #     for_each = var.metrics == null ? [] : var.metrics

  #     content {
  #       category = metric.value.name
  #       enabled  = metric.value.enabled

  #       retention_policy {
  #         enabled = metric.value.enabled && metric.value.retention_days != null ? true : false
  #         days    = metric.value.enabled ? metric.value.retention_days : 0
  #       }
  #     }
  #   }

}
