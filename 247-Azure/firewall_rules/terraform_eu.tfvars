location        = "eastus"
public_ip_names = ["fw-public", "fw-private"]
priority        = 100
network_rule_collections = [
  {
    action   = "Allow"
    name     = "hub"
    priority = 105
  }
]

network_rules = [
  {
    destination_addresses = ["168.63.129.16"]
    destination_fqdns     = null
    destination_ip_groups = null
    destination_ports     = ["53"]
    name                  = "Net-Coll01"
    protocols             = ["UDP"]
    source_addresses      = ["*"]
    source_ip_groups      = null
  },
  {
    destination_addresses = ["185.38.203.17"]
    destination_fqdns     = null
    destination_ip_groups = null
    destination_ports     = ["443"]
    name                  = "att-out-https"
    protocols             = ["TCP"]
    source_addresses = [
      "10.89.42.5",
      "10.89.42.4",
    ]
    source_ip_groups = null
  },
  # {
  #   destination_addresses = ["10.89.114.22"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["22"]
  #   name                  = "rdp-nat"
  #   protocols             = ["TCP"]
  #   source_addresses      = ["10.88.48.0/20"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.28.0/23"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["5050"]
  #   name                  = "App-SIP"
  #   protocols             = ["UDP"]
  #   source_addresses      = ["10.128.0.8/29"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.28.0/23"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["10000", "30000"]
  #   name                  = "App-RTP"
  #   protocols             = ["UDP"]
  #   source_addresses      = ["10.128.0.8/29"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.24.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "app-service-cde"
  #   protocols             = ["Any"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "app-service-c2c"
  #   protocols             = ["Any"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "app-service-oos"
  #   protocols             = ["Any"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.24.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "icmp-cde"
  #   protocols             = ["ICMP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "icmp-c2c"
  #   protocols             = ["ICMP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["4000", "6060", "8080"]
  #   name                  = "icmp-oos"
  #   protocols             = ["ICMP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.24.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["22"]
  #   name                  = "ssh-cde"
  #   protocols             = ["TCP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["22"]
  #   name                  = "ssh-c2c"
  #   protocols             = ["TCP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # },
  # {
  #   destination_addresses = ["10.89.32.0/21"]
  #   destination_fqdns     = null
  #   destination_ip_groups = null
  #   destination_ports     = ["22"]
  #   name                  = "ssh-oos"
  #   protocols             = ["TCP"]
  #   source_addresses      = ["10.64.0.0/16"]
  #   source_ip_groups      = null
  # }
]

application_rule_collections = [
  {
    action   = "Allow"
    name     = "app-collection"
    priority = 110
  }
]

app_rules = [
  {
    destination_addresses = null
    destination_fqdns     = ["proxy01-east.infra.cloud.247-inc.net", "metadata.google.internal"]
    name                  = "247-internal"
    protocols = [
      {
        port = 80
        type = "Http"
      },
      {
        port = 443
        type = "Https"
      },
    ]
    source_addresses = ["*"]
    source_ip_groups = null
    web_categories   = null
  },
  {
    destination_addresses = null
    destination_fqdns     = ["*.google.com", "*.google.co.in", "google.com"]
    name                  = "google.com"
    protocols = [
      {
        port = 80
        type = "Http"
      },
      {
        port = 443
        type = "Https"
      },
    ]
    source_addresses = ["*"]
    source_ip_groups = null
    web_categories   = null
  },
  {
    destination_addresses = null
    destination_fqdns     = ["ts01-b.cloudsink.net", "lfodown01-b.cloudsink.net"]
    name                  = "crowdstrike"
    protocols = [
      {
        port = 443
        type = "Https"
      },
    ]
    source_addresses = [
      "10.89.26.14",
      "10.89.26.22",
      "10.89.26.18",
      "10.89.26.21",
      "10.89.28.6",
      "10.89.26.17",
      "10.89.26.8",
      "10.89.34.5",
      "10.89.26.5",
      "10.89.34.6",
      "10.89.34.9",
      "10.89.34.4",
      "10.89.34.8",
      "10.89.34.7",
      "10.89.42.5",
      "10.89.42.4",
      "10.89.34.10",
      "10.89.34.11",
      "10.89.26.24",
      "10.89.26.27",
    ]
    source_ip_groups = null
    web_categories   = null
  },
  {
    destination_addresses = null
    destination_fqdns     = ["packages.microsoft.com", "*.guestconfiguration.azure.com"]
    name                  = "packages-microsoft"
    protocols = [
      {
        port = 443
        type = "Https"
      },
    ]
    source_addresses = ["*"]
    source_ip_groups = null
    web_categories   = null
  },
  {
    destination_addresses = null
    destination_fqdns     = ["185.38.203.17"]
    name                  = "allow-superadmin-att"
    protocols = [
      {
        port = 443
        type = "Https"
      },
    ]
    source_addresses = ["10.89.42.5", ]
    source_ip_groups = null
    web_categories   = null
  },
]

nat_rule_collections = [
  {
    action   = "Dnat"
    name     = "hub"
    priority = 100
  }
]

nat_rules = [
  { destination_addresses = "20.39.42.33"
    destination_ports     = ["2353"]
    name                  = "rdp-nat"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    source_ip_groups      = null
    translated_address    = "10.88.52.5"
    translated_port       = "43389"
  },
  {
    destination_addresses = "20.39.42.33"
    destination_ports     = ["2443"]
    name                  = "tfs-fw-https-superadmin-att"
    protocols             = ["TCP"]
    source_addresses      = ["185.38.203.17"]
    source_ip_groups      = null
    translated_address    = "10.89.42.5"
    translated_port       = "443"
  },
  {
    destination_addresses = "20.39.42.33"
    destination_ports     = ["22"]
    name                  = "ssh-nat"
    protocols             = ["TCP"]
    source_addresses      = ["14.143.179.194"]
    source_ip_groups      = null
    translated_address    = "10.89.34.11"
    translated_port       = "22"
  },
]
