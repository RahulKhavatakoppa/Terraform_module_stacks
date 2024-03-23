variable "m_vnetName" {
  type        = string
  description = "vnet name from resource group"
}

variable "m_location" {
  type        = string
  description = "location where the resource has to be deployed"
}

variable "m_resourceGroupName" {
  type        = string
  description = "resoruce group where vnet resource has to bee deployed"
}

variable "m_addressSpace" {
  type        = list(string)
  description = "specified address space for vnet"
}


variable "m_tags" {
  type        = map(string)
  description = "tag for an particular resource"
}
