terraform {
  //Terraform Version
  required_version = "1.1.6"
  //Azure Provider Version
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}