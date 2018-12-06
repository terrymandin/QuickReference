# Terry's Azure Monitor Quick Reference

* Choose "Metrics" on any Azure Resource
  * Select metric type
  * Select create alert
    * Resource, Condition, Action Group and Type (email, etc.)
      * Alert Details: Name, Description, Severity
  * Alerts create new microsoft.insights/metricalerts
* Log Analytics
  * [QuickStart](https://docs.microsoft.com/en-us/azure/log-analytics/query-language/get-started-analytics-portal)
  * Queries can start with either a table name or a search command
  * ```<shift><enter>``` to run queries
  * Sample queries.  Pipe or Search formats.  The following are equivilant
    ```
    Event | search "error"
    search in (Event) "error"
    ```
  * CLI Deployment of Azure Monitoring (not working)
  ```
  az vm extension set \
  --resource-group myResourceGroup \
  --vm-name myVM \
  --name OmsAgentForLinux \
  --publisher Microsoft.EnterpriseCloud.Monitoring \
  --version 1.7 --protected-settings '{"workspaceKey": "omskey"}' \
  --settings '{"workspaceId": "omsid"}'
  ```
  * Add entension with wget [link](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-quick-collect-linux-computer)  
  ```
  wget https://raw.githubusercontent.com/Microsoft/OMS-Agent-for-Linux/master/installer/scripts/onboard_agent.sh && sh onboard_agent.sh -w <YOUR WORKSPACE ID> -s <YOUR WORKSPACE PRIMARY KEY>
  sudo /opt/microsoft/omsagent/bin/service_control restart [<workspace id>]
  ```
    
