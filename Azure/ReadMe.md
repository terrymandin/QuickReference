# Terry's Azure Quick Reference

* AZ commands
  * List available regions
  ```
  az account list-locations |findstr "displayName"
  ```
  * List Resources in Resource Group
  ```
  az resource list -g <resource-group> -o table
  ```
