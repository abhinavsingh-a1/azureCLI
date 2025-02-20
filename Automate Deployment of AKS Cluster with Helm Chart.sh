# Define variables
RESOURCE_GROUP="myResourceGroup"
AKS_NAME="myAKSCluster"
HELM_CHART="nginx-ingress"

# Create the AKS cluster
az aks create \
  --resource-group $RESOURCE_GROUP \
  --name $AKS_NAME \
  --node-count 2 \
  --enable-addons monitoring \
  --generate-ssh-keys

# Get credentials for the cluster
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_NAME

# Install Helm chart
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install $HELM_CHART ingress-nginx/ingress-nginx
