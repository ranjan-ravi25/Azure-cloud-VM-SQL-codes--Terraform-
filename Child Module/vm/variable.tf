
variable "vm_name"{
    type = string
}

variable "resource_group_name" {
    type = string
}

variable "location"{
    type = string
}
variable"vm_size"{
     type = string 
     }

 variable"admin_user"{
    type = string 
}
variable "admin_password"{
type = string
}


variable "image_publisher"{
    type = string 
}
variable "image_offer"{
    type = string
}
variable "image_sku"{
    type = string

}
variable "image_version"{
    type = string
}
variable "network_interface_name"{
    type = string
}
variable "network_interface_location" {
  type = string
}
variable "subnet_name" {
type = string
}
variable "virtual_network_name" {
    type = string 
}
variable "public_ip_name" {
    type = string
}