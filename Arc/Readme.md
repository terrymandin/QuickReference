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

4. Add Policies

- Click on Arc Resource Group
- Click on Policies
- Add these
  - Configure Log Analytics extension on Azure Arc enabled Linux servers
    - On Parameters blade choose your "Log Analytics" service
    - On the Remediation blade click the box and choose the data center
  - Configure Dependency agent on Azure Arc enabled Linux servers
    - On the Remediation blade click the box and choose the data center
  - Configure Log Analytics extension on Azure Arc enabled Windows servers
    - On Parameters blade choose your "Log Analytics" service
    - On the Remediation blade click the box and choose the data center
  - Configure Dependency agent on Azure Arc enabled Windows servers
 - Click on the Policies blade to see status
