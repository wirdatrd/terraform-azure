# Declare variables
variable "environment" {}
variable "location" {}
variable "resource_group_name" {}

variable "admin_username" {}
variable "admin_password" {}

variable "address_space" {
  type = list[string]
}
variable "subnets" {
  type = list[string]
}
variable "subnet_names" {  
  type = list[string]
}

variable "vm_image_publisher" {}
variable "vm_image_offer" {}
variable "vm_image_sku" {}
variable "vm_image_version" {}

variable "scaleset_vm_size" {}
variable "scaleset_capacity" {}
