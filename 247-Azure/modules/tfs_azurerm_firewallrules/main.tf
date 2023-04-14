locals {
  resource_group_name = module.rg.rg_name
  fw_name             = module.hub.fw_name
  fw_pip              = module.hub.fw_pip
  fw_policy_id        = module.hub.fw_policy_id
  loc_prefix          = var.location == "eastus" ? "eu" : "wu"
  location            = var.location
  public_ip_map       = { for pip in var.public_ip_names : pip => true }
}

module "rg" {
  source   = "../tfs_azurerm_truth/rg"
  location = var.location
}

module "hub" {
  source   = "../tfs_azurerm_truth/hub"
  location = var.location
}

resource "azurerm_firewall_policy_rule_collection_group" "fw" {
  name               = lower("tfs-fw-po-rule-col-${terraform.workspace}-${local.loc_prefix}")
  firewall_policy_id = local.fw_policy_id
  priority           = var.priority

  dynamic "network_rule_collection" {
    for_each = var.network_rule_collections == null ? [] : var.network_rule_collections
    content {
      name     = lower("tfs-fw-net-rule-${network_rule_collection.value.name}-${local.loc_prefix}")
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action
      dynamic "rule" {
        for_each = var.network_rules == null ? [] : var.network_rules
        content {
          name                  = rule.value.name
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_addresses = rule.value.destination_addresses
          destination_ip_groups = rule.value.destination_ip_groups
          destination_fqdns     = rule.value.destination_fqdns
          destination_ports     = rule.value.destination_ports
          protocols             = rule.value.protocols
        }
      }
    }
  }

  dynamic "application_rule_collection" {
    for_each = var.application_rule_collections == null ? [] : var.application_rule_collections
    content {
      name     = "${application_rule_collection.value.name}"
      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action
      dynamic "rule" {
        for_each = var.app_rules == null ? [] : var.app_rules
        content {
          name                  = rule.value.name
          web_categories        = rule.value.web_categories
          destination_addresses = rule.value.destination_addresses
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_fqdns     = rule.value.destination_fqdns

          dynamic "protocols" {
             for_each = rule.value.protocols == null ? [] : rule.value.protocols
            content {
              type = protocols.value.type
              port = protocols.value.port
            }
          }
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = var.nat_rule_collections == null ? [] : var.nat_rule_collections
    content {
      name     = lower("tfs-fw-nat-rule-${nat_rule_collection.value.name}-${local.loc_prefix}")
      priority = nat_rule_collection.value.priority
      action   = nat_rule_collection.value.action
      dynamic "rule" {
        for_each = var.nat_rules == null ? [] : var.nat_rules
        content {
          name                = rule.value.name
          source_addresses    = rule.value.source_addresses
          source_ip_groups    = rule.value.source_ip_groups
          destination_address = rule.value.destination_addresses
          destination_ports   = rule.value.destination_ports
          translated_port     = rule.value.translated_port
          translated_address  = rule.value.translated_address # Private IP
          protocols           = rule.value.protocols
        }
      }
    }
  }
}
