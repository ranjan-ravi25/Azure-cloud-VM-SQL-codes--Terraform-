variable "public_ip_name" {
  description = "The name of the public IP"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "location" {
  description = "The location of the public IP"
  type        = string
}
variable "allocation_method" {
  description = "The allocation method of the public IP"
  type        = string
}