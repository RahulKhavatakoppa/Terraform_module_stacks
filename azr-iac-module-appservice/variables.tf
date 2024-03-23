variable "m_app_serviceplan_name" {
  type = string
}

variable "m_resource_group_name" {
  type = string
}

variable "m_location" {
  type = string
}

variable "m_appservice_tier" {
  type = string
}

variable "m_appservice_size" {
  type = string
}

variable "m_web_appservice_name" {
  type = string
}

variable "m_connectionstring_name" {
  type = string
}

variable "m_connection_type" {
  type = string
}

variable "m_contection_string" {
  type = string
}

variable "m_appinsight_instrumentationkey" {
  type = string
}

variable "m_accountname" {
  type = string
}

variable "m_storage_type" {
  type = string
}

variable "m_storage_account_accesskey" {
  type = string
}

variable "m_storageaccount_name" {
  type = string
}

variable "m_share_name" {
  type = string
}

variable "m_vnet_subnet_id" {
  type = string
}

variable "m_private_endpoint_name" {
  type = string
}

variable "m_subnetId" {
  type = string
}

variable "m_tags" {
  type = map(string)
}

variable "m_private_service_conn_name" {
  type = string
}


variable "m_is_manual_connection" {
  type = bool
}

variable "m_subresource_names" {
  type = list(string)
}