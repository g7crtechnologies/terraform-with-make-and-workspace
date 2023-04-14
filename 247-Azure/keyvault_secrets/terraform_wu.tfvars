location = "westus"
secret_value = "value"
ssh_key_map = {
  "dev" = {
    "dev" = {
      ssh_key_name    = "tfs-ssh-key"
      ssh_key_rg_name = "tfs-rg-dev-eu-landingzone"
    }
  }
}

tags = {
  dev = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "secret"
  }
}
