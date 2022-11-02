# Azure Arc

Arc Agent is azcmagent.  It is composed of:
-  Hybrid Instance Metadata Service (HIMDS).  Handles managed identity and communication with Azure AD.
-  Guest Configuration. Responsible for evaluating Azure Policy on the machine.
-  Extension Manager. Manages VM extensions, including install, uninstall, and upgrade.  e.g. Update Management, Log Analytics (MMAExtension)
-  [Azure Policy built-in definitions for Azure Arc-enabled servers](https://learn.microsoft.com/en-us/azure/azure-arc/servers/policy-reference).  e.g.:
   - Azure Security agent should be installed on your [Linux/Windows] Arc machines
   - ChangeTracking extension should be installed on your [Linux/Windows] Arc machine
- Assign policies at the tenant, subscription, or resource level
- Need the Log Analytics and teh Dependency agents to enable insights

## Commands

- See status
  ```
  sudo azcmagent show
  ```
- Check Linux status of the Hybrid Instance Metadata Service
  ```
  sudo lsof -ai -p $(pidof himds)
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
 - Azure Monitor
   - [Preview]: Deploy a VMInsights Data Collection Rule and Data Collection Rule Association for Arc
   - Configure Linux Arc-enabled machines to run Azure Monitor Agent
   - Configure Dependency agent on Azure Arc enabled Linux servers with Azure Monitoring Agent settings
   - Configure Windows Arc-enabled machines to run Azure Monitor Agent
   - Configure Dependency agent on Azure Arc enabled Windows servers with Azure Monitoring Agent settings
