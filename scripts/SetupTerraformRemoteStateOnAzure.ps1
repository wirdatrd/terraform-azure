##  This script can be run from VS Code terminal (Git Bash), 
##  the Azure Portal (via Cloud Shell), PowerShell, 
##  the Azure CLI, or Terraform itself.

az login

az account show

az account set -s "CHL-MGMT-DevOps"

set -e
 
export LOCATION="centralus"
export RESOURCE_GROUP_NAME="Terraform-PoC"
export TF_STATE_STORAGE_ACCOUNT_NAME="tfpocstorageaccountforsecrets"
export TF_STATE_CONTAINER_NAME="tfstate"
export KEYVAULT_NAME="terraform-poc-keyvault"
 
# Create the resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION --verbose
 
echo "Resource group $RESOURCE_GROUP_NAME created."
 
# Create the storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --name $TF_STATE_STORAGE_ACCOUNT_NAME --sku "Standard_LRS" --encryption-services "blob"
 
echo "Storage account $TF_STATE_STORAGE_ACCOUNT_NAME created."
 
# Retrieve the storage account key
$ACCOUNT_KEY = $(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $TF_STATE_STORAGE_ACCOUNT_NAME --query [0].value -o tsv)
 
echo "Storage account key retrieved."
 
# Create a storage container (for the Terraform State)
az storage container create --name $TF_STATE_CONTAINER_NAME --account-name $TF_STATE_STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
 
echo "Storage container $TF_STATE_CONTAINER_NAME created."
 
# Create an Azure KeyVault
az keyvault create -g $RESOURCE_GROUP_NAME -l $LOCATION --name $KEYVAULT_NAME
 
echo "Key vault $KEYVAULT_NAME created."
 
# Store the Terraform State Storage Key into KeyVault
az keyvault secret set --name tfstate-storage-key --value $ACCOUNT_KEY --vault-name $KEYVAULT_NAME
 
echo "Key vault secret created."
 
# Display information
echo "Azure Storage Account and KeyVault have been created."
##echo "terraform init -backend-config=\"storage_account_name=$TF_STATE_STORAGE_ACCOUNT_NAME\" 
-backend-config=\"container_name=$TF_STATE_CONTAINER_NAME\" 
-backend-config=\"access_key=\$(az keyvault secret show --name tfstate-storage-key --vault-name $KEYVAULT_NAME --query value -o tsv)\" -backend-config=\"key=terraform-ref-architecture-tfstate\""
