output "stg_acc_id" {
  value = [ 
    for storage_account in azurerm_storage_account.storageacc : storage_account.id
  ]
}
