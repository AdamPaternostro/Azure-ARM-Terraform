terraform {
  backend "azurerm" {
    storage_account_name = "REPLACE_ME"
    key                  = "terraform-web-app.tf"
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

resource "azurerm_resource_group" "default" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "default" {
  name                = "${var.app_service_plan_name}"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"

  sku {
    tier = "${var.app_service_plan_sku_tier}"
    size = "${var.app_service_plan_sku_size}"
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.app_service_web_app_name}"
  location            = "${azurerm_resource_group.default.location}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  app_service_plan_id = "${azurerm_app_service_plan.default.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2015"
  }
}

output "app_service_name" {
  value = "${azurerm_app_service.default.name}"
}

output "app_service_default_hostname" {
  value = "https://${azurerm_app_service.default.default_site_hostname}"
}