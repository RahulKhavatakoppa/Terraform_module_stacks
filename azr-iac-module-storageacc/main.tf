##########################
#   Storage account      #
##########################
resource "azurerm_storage_account" "az_myStorageAcc" {
  name                     = var.m_storageAccName
  resource_group_name      = var.m_resourceGroupName
  location                 = var.m_location
  account_tier             = var.m_accTier
  account_replication_type = var.m_accReplicationType

  tags = var.m_tags
}


######################################
#  Private Endpoint for the storage account #
######################################
resource "azurerm_private_endpoint" "az_private_endpoint" {
  name                = var.m_private_endpoint_name
  resource_group_name = var.m_resourceGroupName
  location            = var.m_location
  subnet_id           = var.m_subnetId
  tags                = var.m_tags

  private_service_connection {
    name                           = var.m_private_service_conn_name
    private_connection_resource_id = azurerm_storage_account.az_myStorageAcc.id
    is_manual_connection           = var.m_is_manual_connection
    subresource_names              = var.m_subresource_names
  }
}