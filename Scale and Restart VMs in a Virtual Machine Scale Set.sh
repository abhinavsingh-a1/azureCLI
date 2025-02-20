# Define variables
RESOURCE_GROUP="myResourceGroup"
VMSS_NAME="myVMSS"
NEW_CAPACITY=5

# Scale the VMSS
az vmss scale --resource-group $RESOURCE_GROUP --name $VMSS_NAME --new-capacity $NEW_CAPACITY

# Restart all instances
az vmss restart --resource-group $RESOURCE_GROUP --name $VMSS_NAME --instance-ids "*"
