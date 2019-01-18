# Terry's Modbus Quick Reference 



## Create Resource Group

```
az group create -l <location> -n <resourceGroupName>
```

## Create VM's

### Modbus Simulator (Windows)

[Simulator](http://www.winmodbus.com/new/)
[Easy Modbus](https://sourceforge.net/projects/easymodbustcp/)

### Edge (Linux)

List Images

```
az vm image list --all -p microsoft_iot_edge -o table
```

```
az vm create \
  --no-wait \
  --resource-group <resourceGroupName> \
  --name <VMName> \
  --image microsoft_iot_edge:iot_edge_vm_ubuntu:ubuntu_1604_edgeruntimeonly:1.0.1 \
  --admin-username <username> \
  --admin-password '<Password>'
```

### Configure Module

- [Module Documentation](https://docs.microsoft.com/en-gb/azure/iot-edge/deploy-modbus-gateway)
