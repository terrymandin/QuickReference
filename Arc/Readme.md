# Azure Arc

## Commands

- See status
  ```
  sudo azcmagent show
  ```
## Demo

1. [Setup the environment](https://github.com/terrymandin/QuickReference/tree/master/Arc/Environment)

2. Create an Azure Service Principal to onboard infrastructure

# Create an Azure Service Principal

```
az ad sp create-for-rbac -n "<Your Unique Name>" --role "Azure Connected Machine Onboarding" --scopes /subscriptions/$subscriptionId
```

3. Onboard Servers.  Check Linux with this command:

```
sudo lsof -ai -p $(pidof himds)
```
