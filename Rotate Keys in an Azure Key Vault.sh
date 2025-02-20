# Define variables
KEY_VAULT="myKeyVault"
KEY_NAME="myKey"

# Create a new version of the key
az keyvault key create \
  --name $KEY_NAME \
  --vault-name $KEY_VAULT \
  --kty RSA \
  --size 2048

# List all versions of the key
az keyvault key list-versions \
  --name $KEY_NAME \
  --vault-name $KEY_VAULT \
  --query "[].kid" \
  --output table
