# Define variables
RESOURCE_GROUP="myResourceGroup"
SERVER_NAME="mySqlServer"
DATABASE_NAME="myDatabase"

# Get CPU usage metrics
az monitor metrics list \
  --resource "/subscriptions/{subscriptionId}/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Sql/servers/$SERVER_NAME/databases/$DATABASE_NAME" \
  --metric "dtu_consumption_percent" \
  --interval PT1M \
  --start-time $(date -d "-1 hour" +"%Y-%m-%dT%H:%M:%SZ") \
  --end-time $(date +"%Y-%m-%dT%H:%M:%SZ") \
  --query "value[].{Timestamp:timeseries[0].data[0].timeStamp,Average:timeseries[0].data[0].average}" \
  --output table
