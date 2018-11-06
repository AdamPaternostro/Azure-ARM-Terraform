```
# Show importing resources
# Show getting the resource id
# Import
# Run show command - you need to update your TF by hand

../terraform init
../terraform import azurerm_storage_account.REPLACE_ME /subscriptions/REPLACE_ME_SUBSCRIPTION_ID/resourceGroups/Sample.Base/providers/Microsoft.Storage/storageAccounts/REPLACE_ME
../terraform show
```