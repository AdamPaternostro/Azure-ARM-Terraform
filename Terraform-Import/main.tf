terraform {
  backend "azurerm" {
    storage_account_name = "REPLACE_ME"
    key                  = "terraform-import.tf"
    container_name       = "terraform"
    access_key           = "REPLACE_ME"
  }
}

provider "azurerm" {
  subscription_id = "REPLACE_ME_SUBSCRIPTION_ID"  
  client_id       = "REPLACE_ME"  
  client_secret   = "REPLACE_ME"  
  tenant_id       = "REPLACE_ME"
}

resource "azurerm_resource_group" "testrg" {
  name     = "Sample.Base"
  location = "eastus2"
}

resource "azurerm_storage_account" "REPLACE_ME" {
}