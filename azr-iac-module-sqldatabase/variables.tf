variable "m_sqlserver_name" {
  type = string
}

variable "m_resource_group_name" {
  type = string
}

variable "m_location" {
  type = string
}

variable "m_administrator_login" {
  type = string
}

variable "m_sqldatabase_name" {
  type = string
}

variable "m_license_type" {
  type = string
}

variable "m_collation" {
  type = string
}

variable "m_max_size" {
  type = string
}

variable "m_read_scale" {
  type = bool
}

variable "m_sku_name" {
  type = string
}

variable "m_zone_redudant" {
  type = bool
}

variable "m_keyvault_id" {
  type = string
}

variable "m_content_type" {
  type = string
}

variable "m_secret_name" {
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