# Define variables
RESOURCE_GROUP="myResourceGroup"
SCRIPT_URI="https://raw.githubusercontent.com/Azure-Samples/custom-script/master/scripts/hello-world.sh"

# Get all VMs in the resource group
VMS=$(az vm list --resource-group $RESOURCE_GROUP --query "[].name" -o tsv)

# Deploy the script extension to each VM
for VM_NAME in $VMS; do
  az vm extension set \
    --resource-group $RESOURCE_GROUP \
    --vm-name $VM_NAME \
    --name CustomScript \
    --publisher Microsoft.Azure.Extensions \
    --settings "{\"fileUris\": [\"$SCRIPT_URI\"], \"commandToExecute\": \"./hello-world.sh\"}"
done
