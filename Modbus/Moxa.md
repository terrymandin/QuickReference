# Terry's Modbus Quick Reference for installing IoT Edge on a Moxa-8112-ME-T device

## Configure Moxa device to be DHCP on LAN 1 ([link](https://wiki.debian.org/NetworkConfiguration#Using_DHCP_to_automatically_configure_the_interface))

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
## Install IoT Edge on Moxa device

Install curl
```
apt-get update
apt-get install curl
```

Follow these [steps](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux-arm).  

As Debian 8 is not a supported OS for the default install, further steps are required.




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
az vm create \
  --no-wait \
  --resource-group <resourceGroupName> \
  --name <VMName> \
  --image microsoft_iot_edge:iot_edge_vm_ubuntu:ubuntu_1604_edgeruntimeonly:1.0.1 \
  --admin-username <username> \
  --admin-password '<Password>'
```
