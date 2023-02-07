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
