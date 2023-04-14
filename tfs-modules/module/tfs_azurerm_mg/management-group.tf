data "azurerm_subscription" "current" {}
#------------------------------------------
# Local Varaibles
#------------------------------------------
locals {
  parent                     = var.parent_management_group_name != null ? true : false
  parent_management_group_id = var.parent_management_group_id
  tenant_root_group_id       = "/providers/Microsoft.Management/managementGroups/${data.azurerm_subscription.current.tenant_id}"
  display_name               = var.display_name
  parent_id                  = local.parent ? var.parent_management_group_id : local.tenant_root_group_id
}

#------------------------------------------
# Management Group
#------------------------------------------

resource "azurerm_management_group" "mg" {

  display_name               = local.display_name
  name                       = local.display_name
  parent_management_group_id = var.pid == true ? local.parent_id : var.remote_state
  subscription_ids           = var.subscription_ids
}
