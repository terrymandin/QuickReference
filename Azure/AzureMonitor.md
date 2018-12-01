# Terry's Azure Monitor Quick Reference

* Choose "Metrics" on any Azure Resource
  * Select metric type
  * Select create alert
    * Resource, Condition, Action Group and Type (email, etc.)
      * Alert Details: Name, Description, Severity
  * Alerts create new microsoft.insights/metricalerts
* Logs
  * [QuickStart](https://docs.microsoft.com/en-us/azure/log-analytics/query-language/get-started-analytics-portal)
  * Queries can start with either a table name or a search command
  * ```<shift><enter>``` to run queries
  * Sample queries.  Pipe or Search formats.  The following are equivilant
    ```
    Event | search "error"
    search in (Event) "error"
    ```
    
      
    
