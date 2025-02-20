# Define variables
SUBSCRIPTION_ID="{subscriptionId}"
START_DATE=$(date -d "-7 days" +"%Y-%m-%d")
END_DATE=$(date +"%Y-%m-%d")

# Query cost data
az consumption usage list \
  --subscription $SUBSCRIPTION_ID \
  --start-date $START_DATE \
  --end-date $END_DATE \
  --query "[].{Resource:resourceName,Cost:pretaxCost}" \
  --output table
