```
# Shows how to create many copies of a resource

# Login
az login

# Select Subscription
az account set -s REPLACE_ME_SUBSCRIPTION_ID

# Script parameters
resourceGroup="arm-keyvault"
location="eastus"
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

# Create resource group
az group create \
  --name        $resourceGroup \
  --location    $location


# Deploy the ARM template
az group deployment create \
  --name                 $deploymentName \
  --resource-group       $resourceGroup \
  --template-file        template.json \
  --parameters           parameters.json 

######################################
# Show in Portal that Secret is Hidden
######################################

# Clean up resource group
az group delete --name $resourceGroup
```