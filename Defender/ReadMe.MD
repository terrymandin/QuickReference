# Defender for IoT

## Queries
```
SecurityAlert 
| where DisplayName != "Device is silent"
```
```
SecurityRecommendation 
| project TimeGenerated, DeviceId, RecommendationDisplayName, Description, RecommendationSeverity 
```
