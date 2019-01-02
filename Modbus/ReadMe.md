# Terry's Modbus Quick Reference

## Configure Moxa device to be DHCP on LAN 1

```
cp /etc/network/interfaces /etc/network/interfaces.bu
vi /etc/network/interfaces
```

Add the following:
```
auto eth0
allow-hotplug eth0
iface eth0 inet dhcp
```

## Create Resource Group

```
az group create -l <location> -n <resourceGroupName>
```

## Create VM's

### Modbus Simulator (Windows)



### Edge (Linux)

List Images

```
az vm image list --all -p microsoft_iot_edge -o table
```

```
ResourceGroupName='<resource-group>'
VMName=<VM-name>
az vm create \
  --resource-group $ResourceGroupName \
  --name $VMName \
  --image microsoft_iot_edge:iot_edge_vm_ubuntu:ubuntu_1604_edgeruntimeonly:1.0.1 \
  --admin-username <username> \
  --admin-password '<Password>'
```
