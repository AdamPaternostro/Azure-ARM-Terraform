```
# Shows using ARM template like modules or seperated for readability / re-use
# Show templates in blob storage
# Need to change your main template
# Need to change your Depends On
# Need to adjust your parameters (and how they are passed in)

# Login
az login

# Select Subscription
az account set -s REPLACE_ME_SUBSCRIPTION_ID

# Script parameters
resourceGroup="arm-split"
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
  --parameters           @parameters.json 


# Clean up resource group
az group delete --name $resourceGroup
```