########################################################################
########################################################################
#                                                                      #
#        Script to create KPMG application (Resource Group)           #
#                                                                      #
########################################################################
########################################################################

######################################
#  Main Resource Group of APP        #
######################################
resource "azurerm_resource_group" "az_myResourceGroup" {
  name     = var.m_resourceGroupName
  location = var.m_location
}
