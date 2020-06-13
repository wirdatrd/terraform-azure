/*##################################
#######     Variables.tf     #######
*/

variable "project_name" {
  description = "The name of the overall project"
  default = ""
}

variable "applicaiton_name" {
  description = "The name of the application within the project"
  default = ""
}

variable "prefix" {
  description = "Prefix to attach to resources within the project"
  default = "vmss"
}

variable "location" {
  description = "The Azure region where resources are located"
  default     = "Central US"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the resources are created"
  default     = "${var.project}-${var.prefix}-packer-rg"
}

variable "domain_name_label" {
  description = "Domain name label"
  default     = "vmsspackerasr999"
}

variable "image_resource_group_name" {
  description = "The name of the resource group in which the Packer images are"
  default     = "packertest-rg"
}

variable "image_name" {
  description = "The Packer image name"
  # Packer image created using this repo: https://github.com/adamrushuk/Packer-Templates#azure-ubuntu-image
  default     = "ArUbuntu1604Image"
}

variable "application_port" {
  description = "The port that you want to expose to the external load balancer"
  default     = 80
}

variable "admin_username" {
  description = "Default admin username"
  default     = "azureuser"
}

variable "admin_password" {
  description = "Default password for admin"
  default     = "Passwwoord11223344"
}
