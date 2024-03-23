variable "m_keyvault_name" {
  type = string
}

variable "m_resource_group_name" {
  type = string
}

variable "m_location" {
  type = string
}

variable "m_enabled_for_disk_encryption" {
  type = bool
}

variable "m_soft_delete_retention_days" {
  type = string
}

variable "m_purge_protection_enabled" {
  type = bool
}

variable "m_sku_name" {
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