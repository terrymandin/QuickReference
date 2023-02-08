# Terry's ARM Quick Reference

* Find all Resource providers
  ```
  az provider show --namespace Microsoft.Batch
  ```
  
# Resource Providers

https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers

# Templates

[Define resources with Bicep, ARM templates, and Terraform AzAPI provider](https://learn.microsoft.com/en-us/azure/templates/)

## Deploy ARM Template
```
templateFile="{provide-the-path-to-the-template-file}"
az deployment group create \
  --name blanktemplate \
  --resource-group myResourceGroup \
  --template-file $templateFile
  --parameters <name>=<value> <name2>=<value2>
```
