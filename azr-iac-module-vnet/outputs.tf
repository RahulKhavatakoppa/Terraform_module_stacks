output "vnet_name" {
  value       = azurerm_virtual_network.az_myVnet.name
  description = "vnet name"
}

output "vnat_id" {
  value       = azurerm_virtual_network.az_myVnet.id
  description = "Vnet id"
}