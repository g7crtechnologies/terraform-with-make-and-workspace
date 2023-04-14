location = "westus"
routes = {
  "hub" = {
    "hub" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-hub-wu-speech"
    },
  },

  "prod" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-prod-c2c-wu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-prod-cde-wu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-prod-oos-wu-speech"
    },
  },

  "psr" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-psr-c2c-wu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-psr-cde-wu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-psr-oos-wu-speech"
    },
  },

  "dev" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-dev-c2c-wu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-dev-cde-wu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-dev-oos-wu-speech"
    },
  },

  "qa" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-qa-c2c-wu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-qa-cde-wu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-qa-oos-wu-speech"
    },
  },

  "stg" = {
    "c2c" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-stg-c2c-wu-speech"
    },
    "cde" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-stg-cde-wu-speech"
    },
    "oos" = {
      name                   = "route-01"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "10.86.48.4"
      route_table_name       = "tfs-rt-stg-oos-wu-speech"
    },
  }
}

