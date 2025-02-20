# Define variables
FRONTDOOR_NAME="myFrontDoor"
RESOURCE_GROUP="myResourceGroup"

# Add a forwarding rule
az network front-door rule create \
  --frontdoor-name $FRONTDOOR_NAME \
  --resource-group $RESOURCE_GROUP \
  --rule-name "CustomRule" \
  --priority 1 \
  --route-type Forward \
  --backend-pool "myBackendPool" \
  --patterns-to-match "/*" \
  --match-variable RequestUri \
  --operator Contains \
  --match-values "/api"
