terraform {
  backend "azurerm" {
    storage_account_name = "REPLACE_ME"
    key                  = "terraform-loop.tf"
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

variable "storageaccountnames" {
  description = "Create many storage accounts"
  type = "list"
  default = ["myuniquename001", "myuniquename002"]
}

resource "azurerm_resource_group" "testrg" {
  name     = "terraform-loop"
  location = "westus"
}

resource "azurerm_storage_account" "testsa" {
  count                    = 2
  name                     = "${element(var.storageaccountnames, count.index)}"
  resource_group_name      = "${azurerm_resource_group.testrg.name}"
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}