# Assign variables
environment         = "linux-vm-remote-exec"
location            = "eastus"
resource_group_name = "linux-remote-exec-rg"
admin_username      = "azureuser"
admin_password      = "Pa55word!Pa55word!"
address_space       = ["10.0.0.0/16"]
vm_size             = "Standard_DS2_v2" #"Standard_B1s"
vm_image_publisher  = "OpenLogic"
vm_image_offer      = "CentOS"
vm_image_sku        = "7.6"
vm_image_version    = "latest"
