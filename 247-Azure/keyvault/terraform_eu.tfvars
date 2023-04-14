key_vault_map = {
  "hub" = {
    "hub" = {
      key_per     = ["Get"]
      name        = "hub"
      secret_per  = ["Get"]
      sku         = "standard"
      storage_per = ["Get"]
    },
  },
  "dev" = {
    "dev" = {
      key_per     = ["Get"]
      name        = "dev"
      secret_per  = ["Get"]
      sku         = "standard"
      storage_per = ["Get"]
    },
  },
}
location = "eastus"

tags = {
  dev = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "secret"
  }
}
