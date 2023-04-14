#------------------------------------------
# Module for Azure Policies
#------------------------------------------
module "Azure_policies" {
  source       = "../module/tfs_azurerm_policy"
  policy       = var.policy
  display_name = var.display_name
  policy_rg    = var.policy_rg
}
