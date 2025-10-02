variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}
variable"virtual_network_location" {
  description = "The location of the virtual network"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "address_space" {
  description = "The address space of the virtual network"
  type        = list(string)
}
variable "dns_servers" {
  description = "The DNS servers for the virtual network"
  type        = list(string)
}