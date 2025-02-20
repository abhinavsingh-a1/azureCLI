# Define variables
RESOURCE_GROUP="myResourceGroup"
LOCATION="eastus"
TEMPLATE_FILE="multi-tier-app.json"
PARAMETERS_FILE="parameters.json"

# Create the resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Deploy the ARM template
az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file $TEMPLATE_FILE \
  --parameters @$PARAMETERS_FILE
