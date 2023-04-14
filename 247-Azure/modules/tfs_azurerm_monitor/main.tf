data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  # location = var.location
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  address_prefixes     = var.subnet_address_prefixes
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
}
resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "nic" {
  count = 3
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.pip.id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_ssh_public_key" "vm" {
  name                = var.ssh_key
  resource_group_name = var.sshkey_rg
}
resource "azurerm_linux_virtual_machine" "vm" {
  count               = 3
  name                = "Mytestvm-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.virtual_machine_size
  admin_username      = var.os_admin_username
  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  admin_ssh_key {
    username   = var.os_admin_username
    public_key = data.azurerm_ssh_public_key.vm.public_key
  }

}


resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_SKU
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "log_analytics_solution" {
  solution_name         = var.log_analytics_solution_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.law.id
  workspace_name        = azurerm_log_analytics_workspace.law.name
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_virtual_machine_extension" "AzureMonitorLinuxAgent" {
  count                      = 3
  name                       = var.virtual_machine_extension
  virtual_machine_id         = azurerm_linux_virtual_machine.vm[count.index].id
  publisher                  = var.virtual_machine_extension_publisher
  type                       = var.virtual_machine_extension_type
  type_handler_version       = var.virtual_machine_extension_version
  auto_upgrade_minor_version = true


}
resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                = var.data_collection_rule_name
  resource_group_name = var.resource_group_name
  location            = var.location

  destinations {
    log_analytics {
      workspace_resource_id = azurerm_log_analytics_workspace.law.id
      name                  = "test-destination-log"
    }

    azure_monitor_metrics {
      name = "test-destination-metrics"
    }
  }

  data_flow {
    streams      = ["Microsoft-InsightsMetrics"]
    destinations = ["test-destination-log"]
  }

  data_sources {

    performance_counter {
      streams                       = ["Microsoft-InsightsMetrics"]
      sampling_frequency_in_seconds = 60
      counter_specifiers            = ["\\VmInsights\\DetailedMetrics"]
      name                          = "VMInsightsPerfCounters"
    }
  }
}

# associate to a Data Collection Rule
resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
  count                   = 3
  name                    = var.data_collection_rule_association
  target_resource_id      = azurerm_linux_virtual_machine.vm.*.id[count.index]
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
  description             = "example"
}


