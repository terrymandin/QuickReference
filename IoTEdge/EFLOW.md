# EFLOW Quick Reference

## Commands

```
Set-EflowVm
Connect-EflowVm
Copy-EflowVmFile
```

## Enable Defender

```
systemctl enable defender-iot-micro-agent.service
```

View in Log Analytics
- Under AzureSecurityOfThings
- View SecurityIoTRawEvent 

## Troubleshooting

```
PS C:\WINDOWS\system32> Connect-EflowVm
ERROR: 0x80072741
kex_exchange_identification: Connection closed by remote host

PS C:\WINDOWS\system32> stop-eflowvm
PS C:\WINDOWS\system32> start-eflowvm
PS C:\WINDOWS\system32> Connect-EflowVm
iotedge-user@WINDEV2204EVAL-EFLOW [ ~ ]$
```
