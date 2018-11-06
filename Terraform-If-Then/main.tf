terraform {
  backend "azurerm" {
    storage_account_name = "REPLACE_ME" 
    key                  = "terraform-if-then.tf"
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
  name     = "terraform-if-then"
  location = "westus"
}

variable "storageaccountname" {
  type        = "string"
  description = "Name of storage account"
  default     = "terraformifthen"
}

variable "lrsstorageaccount" {
  type        = "string"
  description = "Should we do LRS"
  default     = "true"
}

variable "lrs" {
  type        = "string"
  default     = "LRS"
}

variable "grs" {
  type        = "string"
  default     = "GRS"
}

resource "azurerm_storage_account" "testsa" {
  name                     = "${var.storageaccountname}"
  resource_group_name      = "${azurerm_resource_group.testrg.name}"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "${var.lrsstorageaccount == true ? var.lrs : var.grs}"
}