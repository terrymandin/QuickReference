# Code to purge an Azure Environment

```
#!/bin/bash

# Login to Azure
az login

# Loop through all subscriptions and resource groups
for sub in $(az account list --query '[].id' -o tsv); do
  if [ $sub == "362b8f7b-5745-4ea9-9093-eba73aba7cfb" ] || [ $sub == "e3091c20-6bf6-4d2b-be3e-c3d5608e92e3" ] || [ $sub == "6ac584e0-a24f-4f40-95cb-c9735d70304b" ] || [ $sub == "e8305191-2b3f-4b90-898d-c73c3afed2b3" ] || [ $sub == "3776c7b9-3885-492f-8f00-fe941a916986" ] || [ $sub == "2ba5192b-2ec4-408e-9573-5d7e5fef1078" ]; then
    echo "Skipping subscription: $sub"
    continue
  fi
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
az account management-group delete --name $prefix'-landing-zones'
az account management-group delete --name $prefix'-landingzones'
az account management-group delete --name $prefix'-decommissioned'
az account management-group delete --name $prefix
```
