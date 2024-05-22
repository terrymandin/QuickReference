# Delete Vault
```
Set-AzContext -Tenant <tenant-id> -Subscription <subscription-id>
Select-AzSubscription -SubscriptionName "<subscription-name>"
$vault = Get-AzRecoveryServicesVault -Name "<vault-name>"
Remove-AzRecoveryServicesVault -Vault $vault
```
