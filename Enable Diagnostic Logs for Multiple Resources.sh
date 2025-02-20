# Define variables
RESOURCE_GROUP="myResourceGroup"
WORKSPACE_ID="/subscriptions/{subscriptionId}/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.OperationalInsights/workspaces/myWorkspace"

# List all resources in the resource group
RESOURCES=$(az resource list --resource-group $RESOURCE_GROUP --query "[].id" -o tsv)

# Enable diagnostics for each resource
for RESOURCE_ID in $RESOURCES; do
  az monitor diagnostic-settings create \
    --name "diagnostics-$RESOURCE_ID" \
    --resource $RESOURCE_ID \
    --workspace $WORKSPACE_ID \
    --logs '[
      {
        "category": "AllLogs",
        "enabled": true,
        "retentionPolicy": {
          "days": 0,
          "enabled": false
        }
      }
    ]'
done
