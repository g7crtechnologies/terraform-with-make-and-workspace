variable "location" {
  type = string
}

variable "routes" {
  type = map(map(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
    route_table_name       = string
  })))
  default = {
    "hub" = {
      "c2c" = {
        name                   = "route-01"
        address_prefix         = "0.0.0.0/0"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "10.88.48.4"
        route_table_name       = "tfs-rt-hub-eu-speech"
      },
    }
    "prod" = {
      "c2c" = {
        name                   = "route-01"
        address_prefix         = "0.0.0.0/0"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "10.88.48.4"
        route_table_name       = "tfs-rt-prod-c2c-eu-speech"
      },
    }
  }
}

