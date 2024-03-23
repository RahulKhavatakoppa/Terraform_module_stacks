#Create Random password 
resource "random_password" "randompassword" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

#Create Key Vault Secret
resource "azurerm_key_vault_secret" "sqladminpassword" {
  depends_on = [
    random_password.randompassword
  ]
  name         = var.m_secret_name
  value        = random_password.randompassword.result
  key_vault_id = var.m_keyvault_id
  content_type = var.m_content_type
}

# ######################################
# #  MSSQL server for data base  #
# ######################################
resource "azurerm_mssql_server" "az_sql_server" {
  name                         = var.m_sqlserver_name
  resource_group_name          = var.m_resource_group_name
  location                     = var.m_location
  version                      = "12.0"
  administrator_login          = var.m_administrator_login
  administrator_login_password = random_password.randompassword.result
}

# ######################################
# #  MSSQL data base  #
# ######################################
resource "azurerm_mssql_database" "az_sql_database" {
  name           = var.m_sqldatabase_name
  server_id      = azurerm_mssql_server.az_sql_server.id
  collation      = var.m_collation
  license_type   = var.m_license_type
  max_size_gb    = var.m_max_size
  read_scale     = var.m_read_scale
  sku_name       = var.m_sku_name
  zone_redundant = var.m_zone_redudant
}

# ######################################
# # private endpoint for MSSQL server   #
# ######################################
resource "azurerm_private_endpoint" "az_private_endpoint_database" {
  name                = var.m_private_endpoint_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  subnet_id           = var.m_subnetId
  tags                = var.m_tags

  private_service_connection {
    name                           = var.m_private_service_conn_name
    private_connection_resource_id = azurerm_mssql_server.az_sql_server.id
    is_manual_connection           = var.m_is_manual_connection
    subresource_names              = var.m_subresource_names
  }
}
