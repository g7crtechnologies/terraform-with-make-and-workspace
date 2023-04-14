location = "eastus"
routes = {
  "hub" = {
    "hub" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-hub-eu-speech"
    },
  },

  "prod" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-prod-c2c-eu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-prod-cde-eu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-prod-oos-eu-speech"
    },
  },

  "psr" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-psr-c2c-eu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-psr-cde-eu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-psr-oos-eu-speech"
    },
  },

  "dev" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-dev-c2c-eu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-dev-cde-eu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-dev-oos-eu-speech"
    },
  },

  "qa" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-qa-c2c-eu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-qa-cde-eu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-qa-oos-eu-speech"
    },
  },

  "stg" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-stg-c2c-eu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-stg-cde-eu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.88.48.4"
      route_table_name       = "tfs-rt-stg-oos-eu-speech"
    },
  }
}

