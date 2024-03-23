# ######################################
# #  APP Service Plan for web app   #
# ######################################
resource "azurerm_app_service_plan" "az_appservice_plan" {
  name                = var.m_app_serviceplan_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  sku {
    tier = var.m_appservice_tier
    size = var.m_appservice_size
  }
}

# ######################################
# #  WEB APP Service   #
# ######################################
resource "azurerm_app_service" "az_web_appservice" {
  name                = var.m_web_appservice_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  app_service_plan_id = azurerm_app_service_plan.az_appservice_plan.id

  site_config {
    always_on = true
  }

  https_only = true

  ##########connection to data base access###############
  connection_string {
    name  = var.m_connectionstring_name
    type  = var.m_connection_type
    value = var.m_contection_string
  }
  ################ app insgiht connection for monitoring ####################
  app_settings = {

    "APPINSIGHTS_INSTRUMENTATIONKEY"             = var.m_appinsight_instrumentationkey
    "APPINSIGHTS_PROFILERFEATURE_VERSION"        = "1.0.0"
    "ApplicationInsightsAgent_EXTENSION_VERSION" = "~2"
  }
  ############ storage connection to store app related files #############
  storage_account {
    name         = var.m_accountname
    type         = var.m_storage_type
    access_key   = var.m_storage_account_accesskey
    account_name = var.m_storageaccount_name
    share_name   = var.m_share_name
  }
}

# #########################################################################################
# #  VNET Integrtaion for APP Service to easy connection by using same vnet address space  #
# ########################################################################################
resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_app_service.az_web_appservice.id
  subnet_id      = var.m_vnet_subnet_id
}

# ######################################
# #  private endpoint for app service  #
# ######################################
resource "azurerm_private_endpoint" "az_private_endpoint_webapp" {
  name                = var.m_private_endpoint_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  subnet_id           = var.m_subnetId
  tags                = var.m_tags

  private_service_connection {
    name                           = var.m_private_service_conn_name
    private_connection_resource_id = azurerm_app_service.az_web_appservice.id
    is_manual_connection           = var.m_is_manual_connection
    subresource_names              = var.m_subresource_names
  }
}