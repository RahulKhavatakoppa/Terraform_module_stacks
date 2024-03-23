variable "m_subnetName" {
  type = string
}

variable "m_resourceGroupName" {
  type = string
}

variable "m_vnetName" {
  type = string
}

variable "m_addressPrefixes" {
  type        = list(string)
  description = "The address prefix list to use for the subnet"
}

variable "m_addressPrefixes_vnet" {
  type        = list(string)
  description = "The address prefix list to use for the subnet"
}

variable "m_subnetName_vnet" {
  type = string
}