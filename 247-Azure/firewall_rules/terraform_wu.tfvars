location                 = "westus"
public_ip_names          = ["fw-public", "fw-private"]
priority                 = 100
network_rule_collections = null
network_rules            = null
# network_rule_collections = [
#   {
#     action   = "Allow"
#     name     = "hub"
#     priority = 100
#   }
# ]

# network_rules = [
#   {
#     destination_addresses = ["168.63.129.16"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["53"]
#     name                  = "Net-Coll01"
#     protocols             = ["UDP"]
#     source_addresses      = ["*"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.114.22"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["22"]
#     name                  = "rdp-nat"
#     protocols             = ["TCP"]
#     source_addresses      = ["10.88.48.0/20"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.28.0/23"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["5050"]
#     name                  = "App-SIP"
#     protocols             = ["UDP"]
#     source_addresses      = ["10.128.0.8/29"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.28.0/23"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["10000", "30000"]
#     name                  = "App-RTP"
#     protocols             = ["UDP"]
#     source_addresses      = ["10.128.0.8/29"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.24.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "app-service-cde"
#     protocols             = ["Any"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "app-service-c2c"
#     protocols             = ["Any"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "app-service-oos"
#     protocols             = ["Any"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.24.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "icmp-cde"
#     protocols             = ["ICMP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "icmp-c2c"
#     protocols             = ["ICMP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["4000", "6060", "8080"]
#     name                  = "icmp-oos"
#     protocols             = ["ICMP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.24.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["22"]
#     name                  = "ssh-cde"
#     protocols             = ["TCP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["22"]
#     name                  = "ssh-c2c"
#     protocols             = ["TCP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   },
#   {
#     destination_addresses = ["10.89.32.0/21"]
#     destination_fqdns     = null
#     destination_ip_groups = null
#     destination_ports     = ["22"]
#     name                  = "ssh-oos"
#     protocols             = ["TCP"]
#     source_addresses      = ["10.64.0.0/16"]
#     source_ip_groups      = null
#   }
# ]

application_rule_collections = null
app_rules                    = null

nat_rule_collections = [{
  action   = "Dnat"
  name     = "hub"
  priority = 102
}]

nat_rules = [
  {
    destination_addresses = "168.61.70.23"
    destination_ports     = ["53"]
    name                  = "rdp-nat"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    source_ip_groups      = null
    translated_address    = "8.8.8.8"
    translated_port       = "3389"

  },
  {
    destination_addresses = "168.61.70.23"
    destination_ports     = ["53"]
    name                  = "mgmt-nat"
    protocols             = ["TCP"]
    source_addresses      = ["*"]
    source_ip_groups      = null
    translated_address    = "8.8.8.8"
    translated_port       = "8080"
  }
]


