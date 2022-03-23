# Azure IoT Hub Monitoring

## Queries

### Connect / Disconnect
```
AzureDiagnostics
| where ResourceProvider == "MICROSOFT.DEVICES" and ResourceType == "IOTHUBS"
| where Category == "Connections" 
| search properties_s:"<device name>"
| project SubscriptionId, Category, Resource, OperationName, ResultType, Level
```
