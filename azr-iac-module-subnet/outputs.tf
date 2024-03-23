output "subnetName" {
  value = azurerm_subnet.az_mySubnet.name
}

output "subnetId" {
  value = azurerm_subnet.az_mySubnet.id
}

output "vnetsubnetId" {
  value = azurerm_subnet.az_mySubnet_vnet.id
}