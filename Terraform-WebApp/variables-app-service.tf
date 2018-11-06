variable "app_service_plan_sku_tier" {
  type        = "string"
  description = "SKU tier of the App Service Plan"
  default     = "Standard" 
}

variable "app_service_plan_sku_size" {
  type        = "string"
  description = "SKU size of the App Service Plan"
  default     = "S1"                             
}

variable "app_service_plan_name" {
  type        = "string"
  description = "Name of the app service plan"
  default     = "myuniquenameAppSvc"
}

