variable "resource_group_name" {
  type        = "string"
  description = "Name of the azure resource group."
  default     = "terraform-web-app"
}

variable "location" {
  type        = "string"
  description = "Location of the azure resource group."
  default     = "westus"
}