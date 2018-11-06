```
# Login
az login

# Select Subscription
az account set -s REPLACE_ME_SUBSCRIPTION_ID

# Script parameters
resourceGroup="arm-web-app"
location="eastus"
today=`date +%Y-%m-%d-%H-%M-%S`
deploymentName="MyDeployment-$today"

# Create resource group
az group create \
  --name        $resourceGroup \
  --location    $location


# Validate
az group deployment validate \
  --resource-group       $resourceGroup \
  --template-file        template.json \
  --parameters           @parameters.json


# Deploy the ARM template
az group deployment create \
  --name                 $deploymentName \
  --resource-group       $resourceGroup \
  --template-file        template.json \
  --parameters           @parameters.json 


# View variables
az group deployment show \
  --name                 $deploymentName \
  --resource-group       $resourceGroup \
  --query                properties.outputs.azureWebAppName.value


# Clean up resource group
az group delete --name $resourceGroup
```