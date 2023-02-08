# Terry's Azure Quick Reference

## Azure geographies
- [Global Infrastructure](https://infrastructuremap.microsoft.com/explore?info=region_eastus2)

## AZ commands
  * List available regions
  ```
  az account list-locations |findstr "displayName"
  ```
  * List Resources in Resource Group
  ```
  az resource list -g <resource-group> -o table
  ```
