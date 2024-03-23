data "azurerm_client_config" "current" {}

######################################
#  Keyvault for the the APP          #
######################################
resource "azurerm_key_vault" "az_key_vault" {
  name                        = var.m_keyvault_name
  resource_group_name         = var.m_resource_group_name
  location                    = var.m_location
  enabled_for_disk_encryption = var.m_enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.m_soft_delete_retention_days
  purge_protection_enabled    = var.m_purge_protection_enabled

  sku_name = var.m_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id #### principal id of database has to bee added for access policy assignment 

    key_permissions     = ["Get", ]
    secret_permissions  = ["Get", ]
    storage_permissions = ["Get", ]
  }
}

######################################
#  Private Endpoint for the keyvault #
######################################
resource "azurerm_private_endpoint" "az_private_endpoint_keyvault" {
  name                = var.m_private_endpoint_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  subnet_id           = var.m_subnetId
  tags                = var.m_tags

  private_service_connection {
    name                           = var.m_private_service_conn_name
    private_connection_resource_id = azurerm_key_vault.az_key_vault.id
    is_manual_connection           = var.m_is_manual_connection
    subresource_names              = var.m_subresource_names
  }
}