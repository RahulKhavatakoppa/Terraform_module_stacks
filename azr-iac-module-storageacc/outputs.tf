output "storage_acc_name" {
  value = azurerm_storage_account.az_myStorageAcc.name
}

output "storage_primary_access_key" {
  value       = azurerm_storage_account.az_myStorageAcc.primary_access_key
  description = "The primary access key for the storage account"
}
