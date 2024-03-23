######################################
#  Main VNET of the APP        #
######################################
resource "azurerm_virtual_network" "az_myVnet" {
  name                = var.m_vnetName
  location            = var.m_location
  resource_group_name = var.m_resourceGroupName
  address_space       = var.m_addressSpace
  tags                = var.m_tags
}
