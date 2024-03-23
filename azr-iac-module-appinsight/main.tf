# ######################################
# #  APP insight for APP Service    #
# ######################################
resource "azurerm_application_insights" "az_appinsight" {
  name                = var.m_appinsight_name
  resource_group_name = var.m_resource_group_name
  location            = var.m_location
  application_type    = var.m_app_type
}
