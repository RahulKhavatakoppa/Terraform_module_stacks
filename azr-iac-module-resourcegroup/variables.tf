variable "m_resourceGroupName" {
  type        = string
  description = "The name of the application which requires this module-specific service"
}

variable "m_location" {
  type        = string
  description = "Location where resources should be deployed"
}