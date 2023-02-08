# PowerShell Quickstart

| Description          | Command                                   | 
|----------------------|-------------------------------------------|
| Version              | $PSVersionTable.PSVersion                 |
| List Modules         | Get-Module                                |

## Conventions
- "get" to retrieve data
- "set" to insert or update data
- "format" to format data
- " out" to direct output

## Install Az module
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery
```

## Connect
```
Connect-AzAccount
```

## Context
```
Get-AzContext
Get-AzSubscriptionGet-AzResource
```

## Sample Commands
```
Get-AzResourceGroup
Get-AzResourceGroup | Format-Table
Select-AzSubscription -SubscriptionName '<name>'
New-AzResourceGroup -Name <name> -Location <location>
Get-AzResource
```

## Create Azure VM
```
New-AzVm
       -ResourceGroupName <resource group name>
       -Name <machine name>
       -Credential <credentials object>
       -Location <location>
       -Image <image name>
Remove-AzVM
Start-AzVM
Stop-AzVM
Restart-AzVM
Update-AzVM
```

## Samples

### Createan Azure VM
```
New-AzVm -ResourceGroupName [sandbox resource group name] -Name "testvm-eus-01" -Credential (Get-Credential) -Location "East US" -Image Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest -OpenPorts 22 -PublicIpAddressName "testvm-01"
```
