# Azure Arc

From lab: [Azure Arc for Servers and Kubernetes](https://github.com/howardginsburg/AzureArcTraining#1-deploy-resources)

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
  
## Setup Environment

1. [Setup the environment](https://github.com/terrymandin/QuickReference/tree/master/Arc/Environment)

2. Create an Azure Service Principal to onboard infrastructure

## Servers

### Create an Azure Service Principal

#### az CLI
Create new:
```
az ad sp create-for-rbac -n "<Your Unique Name>" --role "Azure Connected Machine Onboarding" --scopes /subscriptions/$subscriptionId
```
Get existing:
```
az ad sp credential reset --id <ServicePrincipalClientId>
```

#### Portal
1. Navigate to the Azure portal.
1. Select Azure Active Directory from the left-hand side menu.
1. Select App registrations and + New registration.

### Onboard Servers.  
- Go to the Azure Arc blade Azure Portal
- Add multiple servers
- Select the service principal
- Update the secret in the scripts

Windows:
```
Get-Service | grep Azure
```
Ubunutu:
```
sudo lsof -ai -p $(pidof himds)
```

### Add Policies

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

### Insights

- Enable "Insights" for each of the VMs
- Analyze the data
- Note that data is in Azure Monitor.  Alerts can be created
- Click on Map.  Then RDP to the VM and view the map again.  You can see the IP address of the connection

### Logs

- Logs are not ingested by default.  To enable logs:
  - Go to Log Analytics
  - Click on "Legacy Agents Management" and add the logs you want to ingest for OMS Agent or "Agents Management" for Azure Monitor Agent
    - For legacy all Servers send the data.  AMA can allow you to specify a single VM
  
### Inventory

- Enable in Automation account
- Note new "Solutions" in resource group.  These correspond to Workgroups
- Add machines through "Manage machines".  This creates a group.  Look for machine group
- Can monitor for File changes
- Can also monitor change tracking.  View groups in Inventory
- 

### Update Management

- Go to Updates in your Azure Arc VM.  Note that it is in preview, go to the old experience
- Go to automation and enable it
- Manage machines to add machines
- Need to add an agent
  - VM, Updates, Try new Management Update Center, Periodic Assessment, every 24 hours, Add machine, select all
  - Deploys the LinuxPatchExtension
- Go to Updates in Azure Automation, view updates
- Click on one and it will run a Log Analytics query
- Or, go to Updates in the VM to see what is available.  Run a "one time update" or schedule it

## Kubernetes

### Connect

```
az connectedk8s connect -g <your arc resource group> -n <your arc enabled cluster name> --kube-config quickstart-azure-custom.YAML 
```

- deploys HELM chart
- agents get deployed

### Install Extensions

```
az k8s-extension create --name xyz --extension-type Microsoft.AzureMonitor.Containers --scope cluster --cluster-name abc --resource-group x --cluster-type connectedClusters
```

Remember to open ports on the Rancher Server VM: 443

### Commands

```
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get pods -n azure-arc
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get deployment -n azure-arc
```

## Get Service Account Token

From PowerShell:

- [Service Account Token Instructions](https://learn.microsoft.com/azure/azure-arc/kubernetes/cluster-connect?tabs=azure-powershell#service-account-token-authentication-option)

Note:
- Can use Microsoft Defender for Cloud for vulnerabilities and regulatory compliance
- Single pane of class with Sentinel (SIEM)

## Enable Insights

- Go to K8S in your Arc Resource Group
- Click on Insights, enable
   - See that the azuremonitor-containers extension is installing in Extensions

## Install Defender for Cloud

- Goto Microsoft Defender for Cloud
- Click on Environment settings
- Select subscription
- Set the 'Servers' and 'Containers' options to 'On'.
