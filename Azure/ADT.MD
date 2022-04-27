# Azure Digital Twins Quick Reference

## Identity

### Local (In VS Code)

Uses the [DefaultAzureCredential](https://docs.microsoft.com/en-us/dotnet/api/azure.identity.defaultazurecredential?view=azure-dotnet&preserve-view=true) as part of the [Azure.Identity](https://www.nuget.org/packages/Azure.Identity) package.

### In Azure

Get the FunctionApp identity.

In the Azure Portal, turn on "System assigned" identity in the "Identity" blade.

```
az functionapp identity show --resource-group <your-resource-group> --name <your-function-app-name>
```

Assign the FunctionApp PrincipalID to the Azure Digital Twins Data Owner Role

```
az dt role-assignment create --dt-name <your-Azure-Digital-Twins-instance> --assignee "<principal-ID>" --role "Azure Digital Twins Data Owner"
```
