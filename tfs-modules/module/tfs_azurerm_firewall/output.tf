output "fw_name" {
  value = azurerm_firewall.fw.name
}

output "fw_pip" {
  value = [
    for ip in azurerm_public_ip.fw-pip : ip.ip_address
  ]
}

output "fw_policy_id" {
  value = azurerm_firewall_policy.firewall_policy.id
}


output "fw_private_ip" {
  value = azurerm_firewall.fw.ip_configuration[0].private_ip_address
}
