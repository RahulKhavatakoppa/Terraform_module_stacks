#╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
# 3-Tier APPLICATION for KPMG CASE STUDY (RG + VNET + PE SUBNET + VNET SUBNET + KEYVAULT (PE) + STORAGE ACCOUNT (PE) + MSSQL (PE) + APP SERVICE PLAN + APP SERVICE(PE) + PRIVATE ENDPOINTS + VNET INTEGRATION(S) + APP INSIGHTS
#╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
#########################################
# resource group Module call #
#########################################
module "myResourceGroup" {
  source              = ".//../azr-iac-module-resourcegroup"
  m_resourceGroupName = "KPMG"
  m_location          = "West Europe"
}

#########################################
# VNET Module call #
#########################################
module "myVnet" {
  depends_on = [
    module.myResourceGroup
  ]
  source              = ".//../azr-iac-module-vnet"
  m_vnetName          = "myvnet1"
  m_location          = module.myResourceGroup.resource_group_location
  m_resourceGroupName = module.myResourceGroup.resource_group_name
  m_addressSpace      = ["10.0.0.0/24"]
  m_tags = {
    environment = "staging"
  }
}

#########################################
# SUBNET Module call #
#########################################
module "mySubnet" {
  depends_on = [
    module.myVnet
  ]
  source                 = ".//../azr-iac-module-subnet"
  m_subnetName           = "mysubnetpe"
  m_subnetName_vnet      = "mysubnetvnet"
  m_resourceGroupName    = module.myResourceGroup.resource_group_name
  m_vnetName             = module.myVnet.vnet_name
  m_addressPrefixes      = ["10.0.0.0/28"]
  m_addressPrefixes_vnet = ["10.0.0.16/28"]
}

#########################################
# KEYVAULT Module call #
#########################################
module "mykeyvault" {
  depends_on = [
    module.mySubnet
  ]
  source                        = ".//../azr-iac-module-keyvault"
  m_keyvault_name               = "mykeyvault"
  m_location                    = module.myResourceGroup.resource_group_location
  m_resource_group_name         = module.myResourceGroup.resource_group_name
  m_enabled_for_disk_encryption = true
  m_soft_delete_retention_days  = "7"
  m_purge_protection_enabled    = false
  m_sku_name                    = "standard"
  m_private_endpoint_name       = "keyvaultprivateendpoint"
  m_subnetId                    = module.mySubnet.subnetId
  m_tags = {
    environment                 = "staging"
  }
  m_private_service_conn_name   = "service_conn4"
  m_is_manual_connection        = false
  m_subresource_names           = ["vault"]
}

#########################################
# storage account Module call #
#########################################
module "myStorageAcc" {
  depends_on = [
    module.mykeyvault, module.mySubnet
  ]
  source                      = ".//../azr-iac-module-storageacc"
  m_storageAccName            = "mystorage"
  m_resourceGroupName         = module.myResourceGroup.resource_group_name
  m_location                  = module.myResourceGroup.resource_group_location
  m_accTier                   = "Standard"
  m_accReplicationType        = "LRS"
  m_tags = {
    environment               = "staging"
  }
  m_private_endpoint_name     = "storageprivateendpoint"
  m_subnetId                  = module.mySubnet.subnetId
  m_private_service_conn_name = "service_conn1"
  m_is_manual_connection      = false
  m_subresource_names         = ["blob"]

}

#########################################
# MSSQL Module call #
#########################################
module "mysqlserver_database" {
  depends_on = [
    module.myStorageAcc, module.mySubnet
  ]
  source                      = ".//../azr-iac-module-sqldatabase"
  m_sqlserver_name            = "mysqlsever"
  m_resource_group_name       = module.myResourceGroup.resource_group_name
  m_location                  = module.myResourceGroup.resource_group_location
  m_administrator_login       = "adminlogin"
  m_secret_name               = "sqladmin"
  m_keyvault_id               = module.mykeyvault.kv_id
  m_content_type              = "text/plain"

  m_sqldatabase_name          = "mysqldatabase"
  m_collation                 = "SQL_Latin1_General_CP1_CI_AS"
  m_license_type              = "LicenseIncluded"
  m_max_size                  = "4"
  m_read_scale                = true
  m_sku_name                  = "S0"
  m_zone_redudant             = true

  m_private_endpoint_name     = "sqlserverprivateendpoint"
  m_subnetId                  = module.mySubnet.subnetId
  m_tags = {
    environment               = "staging"
  }
  m_private_service_conn_name = "service_conn2"
  m_is_manual_connection      = false
  m_subresource_names         = ["sqlServer"]
}

#########################################
# APP Insight Module call #
#########################################
module "myappinsight" {
  source                        = ".//../azr-iac-module-appinsight"
  m_resource_group_name         = module.myResourceGroup.resource_group_name
  m_location                    = module.myResourceGroup.resource_group_location
  m_appinsight_name             = "webappinsight"
  m_app_type                    = "web"
}

#########################################
# APP Service Module call #
#########################################
module "frontwebservice" {
  depends_on = [
    module.myStorageAcc, module.mysqlserver_database, module.mySubnet
  ]
  source                                = ".//../azr-iac-module-appservice"
  m_app_serviceplan_name                = "myappserviceplan"
  m_resource_group_name                 = module.myResourceGroup.resource_group_name
  m_location                            = module.myResourceGroup.resource_group_location
  m_appservice_tier                     = "Standard"
  m_appservice_size                     = "S1"

  m_web_appservice_name                 = "mywebapp"
  m_connectionstring_name               = "databaseconnection"
  m_connection_type                     = "SQLServer"
  m_contection_string                   = module.mysqlserver_database.sql_connection_string

  m_appinsight_instrumentationkey       = module.myappinsight.instrumentation_key


  m_accountname                         = "mystorageconnection"
  m_storage_type                        = "AzureBlob"
  m_storage_account_accesskey           = module.myStorageAcc.storage_primary_access_key
  m_storageaccount_name                 = module.myStorageAcc.storage_acc_name
  m_share_name                          = "fileshare"

  m_vnet_subnet_id                      = module.mySubnet.vnetsubnetId

  m_private_endpoint_name               = "webappprivateendpoint"
  m_subnetId                            = module.mySubnet.subnetId
  m_tags = {
    environment                         = "staging"
  }
  m_private_service_conn_name           = "service_conn3"
  m_is_manual_connection                = false
  m_subresource_names                   = ["web"]
}
