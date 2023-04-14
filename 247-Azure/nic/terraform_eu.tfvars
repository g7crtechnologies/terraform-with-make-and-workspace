location  = "eastus"
component = "speech"
nsg_name  = "tfs-nsg-dev-cde-app-data-eu-speech"
nic_count = "2"
subnet_id = ""
tags = {
  dev = {
    environment        = "dev"
    finance_allocation = "finance_allocation"
    project_owner      = "speech"
    product            = "speech"
    product_component  = "telapp"
    network_segment    = "cde"
    type_of_appliance  = "web"
    risk_zone          = "zone1"
    appliance_owner    = "networking"
  }
}
