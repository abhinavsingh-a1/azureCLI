# Define variables
RESOURCE_GROUP="myResourceGroup"
VAULT_NAME="myRecoveryServicesVault"

# Get all VMs in the resource group
VMS=$(az vm list --resource-group $RESOURCE_GROUP --query "[].id" -o tsv)

# Enable backup for each VM
for VM_ID in $VMS; do
  az backup protection enable-for-vm \
    --resource-group $RESOURCE_GROUP \
    --vault-name $VAULT_NAME \
    --vm $VM_ID \
    --policy-name "DefaultPolicy"
done
