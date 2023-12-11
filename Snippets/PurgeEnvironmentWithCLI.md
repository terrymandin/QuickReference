# Code to purge an Azure Environment

```
#!/bin/bash

# Login to Azure
az login

# Loop through all subscriptions and resource groups
for sub in $(az account list --query '[].id' -o tsv); do
  #fi
  for rg in $(az group list --subscription $sub --query '[].name' -o tsv); do
      if [ "$rg" == "cloud-shell-storage-westus" ]; then
        echo "Skipping resource group: $rg"
        continue
      fi
      echo "Deleting Resource Group: $rg"
      az group delete --subscription $sub --name $rg --yes --no-wait
  done
done

# Loop through all management groups
prefix='<prefix>'

az account management-group delete --name $prefix'-connectivity'
az account management-group delete --name $prefix'-identity'
az account management-group delete --name $prefix'-management'
az account management-group delete --name $prefix'-platform-connectivity'
az account management-group delete --name $prefix'-platform-identity'
az account management-group delete --name $prefix'-platform-management'
az account management-group delete --name $prefix'-platform'
az account management-group delete --name $prefix'-sandboxes'
az account management-group delete --name $prefix'-sandbox'
az account management-group delete --name $prefix'-corp'
az account management-group delete --name $prefix'-online'
az account management-group delete --name $prefix'-landingzones-corp'
az account management-group delete --name $prefix'-landingzones-online'
az account management-group delete --name $prefix'-landing-zones'
az account management-group delete --name $prefix'-landingzones'
az account management-group delete --name $prefix'-decommissioned'
az account management-group delete --name $prefix

# Portal
az account management-group delete --name $prefix'-connectivity'
az account management-group delete --name $prefix'-identity'
az account management-group delete --name $prefix'-management'
az account management-group delete --name $prefix'-platform'
az account management-group delete --name $prefix'-sandboxes'
az account management-group delete --name $prefix'-corp'
az account management-group delete --name $prefix'-online'
az account management-group delete --name $prefix'-landingzones'
az account management-group delete --name $prefix'-decommissioned'
az account management-group delete --name $prefix
```


