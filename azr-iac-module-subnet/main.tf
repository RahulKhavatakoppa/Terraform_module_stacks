data "azurerm_virtual_network" "az_myVnet" {
  name                = var.m_vnetName
  resource_group_name = var.m_resourceGroupName
}

# ######################################
# #  Subnet for the private endpoint   #
# ######################################
resource "azurerm_subnet" "az_mySubnet" {
  name                 = var.m_subnetName
  resource_group_name  = data.azurerm_virtual_network.az_myVnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.az_myVnet.name
  address_prefixes     = var.m_addressPrefixes
}

# ######################################
# #  Subnet for the Vnet   #
# ######################################
resource "azurerm_subnet" "az_mySubnet_vnet" {
  name                 = var.m_subnetName_vnet
  resource_group_name  = data.azurerm_virtual_network.az_myVnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.az_myVnet.name
  address_prefixes     = var.m_addressPrefixes_vnet
}