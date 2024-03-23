variable "m_storageAccName" {
  type        = string
  description = "The name of the application which requires this module-specific service"
}

variable "m_resourceGroupName" {
  type = string
}

variable "m_location" {
  type = string
}

variable "m_accTier" {
  type        = string
  description = "Account tier of the application  (by default : Standard)"
}

variable "m_accReplicationType" {
  type        = string
  description = "Replication strategy for durability and high availability"
}

variable "m_tags" {
  type = map(string)
}

variable "m_private_endpoint_name" {
  type = string
}

variable "m_subnetId" {
  type = string
}

variable "m_private_service_conn_name" {
  type = string
}

variable "m_is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner? If you are trying to connect the Private Endpoint to a remote resource without having the correct RBAC permissions on the remote resource set this value to true"
}

variable "m_subresource_names" {
  type        = list(string)
  description = "A list of subresource names which the Private Endpoint is able to connect to. subresource_names corresponds to group_id"
}