
output "sql_connection_string" {
  value = "Server=${azurerm_mssql_server.az_sql_server.fully_qualified_domain_name};Database=${azurerm_mssql_database.az_sql_database.name};User Id=${azurerm_mssql_server.az_sql_server.administrator_login}@${azurerm_mssql_server.az_sql_server.name};Password=${azurerm_mssql_server.az_sql_server.administrator_login_password};"
}

