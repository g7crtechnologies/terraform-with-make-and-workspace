
location = "eastus"
nsg      = "tfs-nsg-dev-cde-app-eu-speech"
nsg_rule = {
  "SV2_ssh_dev" = {
    name                         = "SV2_ssh_dev"
    priority                     = 251
    direction                    = "Inbound"
    access                       = "Allow"
    protocol                     = "Tcp"
    source_port_range            = "*"
    destination_port_ranges      = ["22"]
    source_address_prefix        = "10.64.0.0/16"
    destination_address_prefixes = ["10.89.24.0/21", "10.89.32.0/21", "10.89.40.0/21"]
    description                  = "ssh from sv2 to app-subnet"
  }
  "IVR_Switchboard" = {
    name                       = "IVR_Switchboard"
    priority                   = 252
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.89.24.0/21"
    destination_address_prefix = "10.89.32.0/21"
    description                = "Allow telapp/ccxml hosts to query switchboard hosts for routing information for the call"
  }
  "IVR_pdsp" = {
    name                       = "IVR_pdsp"
    priority                   = 502
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["13666"]
    source_address_prefixes    = ["10.90.0.0/15", "10.92.0.0/15", "10.96.0.0/15"]
    destination_address_prefix = "10.89.32.0/21"
    description                = "To synchronize the Switchboard's VAK data with Provisionme and to fetch psmdata"
  }
  "IVR_CCXML" = {
    name                       = "IVR_CCXML"
    priority                   = 503
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["8082"]
    source_address_prefixes    = ["10.90.0.0/15", "10.92.0.0/15", "10.96.0.0/15"]
    destination_address_prefix = "10.89.24.0/21"
    description                = "Accessing CCXML/SCXML state machine"
  }
  "allow_gateway_manager" = {
    name                       = "allow_gateway_manager"
    priority                   = 801
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "GatewayManager"
    destination_address_prefix = "10.73.0.0/16"
    description                = "allow gatewaymanager service tag to qa vnet"
  }
  "allow_azure_lb" = {
    name                       = "allow_azure_lb"
    priority                   = 802
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "AzureLoadBalancer"
    destination_address_prefix = "10.73.0.0/16"
    description                = "allow azureloadbalancer service tag to qa vnet"
  }
  "allow_action_group" = {
    name                       = "allow_action_group"
    priority                   = 803
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "ActionGroup"
    destination_address_prefix = "10.73.0.0/16"
    description                = "allow actiongroup service tag to qa vnet"
  }
}
