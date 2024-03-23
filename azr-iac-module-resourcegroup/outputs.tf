output "resource_group_id" {
  value       = azurerm_resource_group.az_myResourceGroup.id
  description = "resource group id"
}

output "resource_group_name" {
  value       = azurerm_resource_group.az_myResourceGroup.name
  description = "resource group name"
}

output "resource_group_location" {
  value       = azurerm_resource_group.az_myResourceGroup.location
  description = "reesource group location"
}