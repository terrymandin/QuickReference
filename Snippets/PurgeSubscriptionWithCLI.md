```
#!/bin/bash

# Login to Azure
az login

# Loop through all subscriptions and resource groups
for sub in $(az account list --query '[].id' -o tsv); do
  for rg in $(az group list --subscription $sub --query '[].name' -o tsv); do
      if [ "$rg" == "cloud-shell-storage-westus" ]; then
        echo "Skipping resource group: $rg"
        continue
      fi
      echo "Deleting Resource Group: $rg"
      az group delete --subscription $sub --name $rg --yes --no-wait
  done
done
```
