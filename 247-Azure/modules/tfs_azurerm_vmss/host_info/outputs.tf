output "info" {
  description = "a whole bag of data passed back to tfs_compute module..."
  value = {
    # instance_config = local.default_instance_config.I
    # II = local.default_instance_config.II
    vm_count                         = local.default_instance_config.vm_count
    private_ip_address_alloc         = local.default_instance_config.private_ip_address_alloc
    vm_size                          = local.default_instance_config.vm_size
    component                        = local.default_instance_config.component
    location                         = local.default_instance_config.location
    publisher                        = local.default_instance_config.publisher
    offer                            = local.default_instance_config.offer
    sku                              = local.default_instance_config.sku
    version                          = local.default_instance_config.version
    enable_proximity_placement_group = local.default_instance_config.enable_proximity_placement_group
    data_disk_name                   = local.default_instance_config.data_disk_name
    vm_availability_zone             = local.default_instance_config.vm_availability_zone
    admin_username                   = local.default_instance_config.admin_username
    caching_type                     = local.default_instance_config.caching_type
    managed_disk_type                = local.default_instance_config.managed_disk_type
    create_option                    = local.default_instance_config.create_option
    tags                             = local.default_instance_config.tags
    ssh_key_name                     = local.default_instance_config.ssh_key_name
    alt_datacenter                   = local.default_instance_config.alt_datacenter
    datacenter                       = local.default_instance_config.datacenter
    dns_name                         = local.default_instance_config.dns_name
    short_dns_name                   = local.default_instance_config.short_dns_name
    environment                      = local.default_instance_config.environment
    az_alt_region                    = local.default_instance_config.az_alt_region
    az_region                        = local.default_instance_config.az_region
    az_zone                          = local.default_instance_config.az_zone
    instance_name                    = local.default_instance_config.instance_name
    network_type                     = local.default_instance_config.network_type
    number1                          = local.default_instance_config.number1
    prefix                           = local.default_instance_config.prefix
    release_type                     = local.default_instance_config.release_type
    // below are the local config for dns records
    dns_a_record_ttl     = local.default_instance_config.dns_a_record_ttl
    dns_a_record_records = local.default_instance_config.dns_a_record_records
    dns_c_record_ttl     = local.default_instance_config.dns_c_record_ttl
    dns_c_record_records = local.default_instance_config.dns_c_record_records
    domain_name          = local.default_instance_config.domain_name
    product              = local.default_instance_config.product
    pvt_dns_rg           = local.default_instance_config.pvt_dns_rg
  }
}
