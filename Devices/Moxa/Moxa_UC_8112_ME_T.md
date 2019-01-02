# Terry's Modbus Quick Reference for installing IoT Edge on a Moxa-8112-ME-T device

## Configure Moxa device to be DHCP on LAN 1 ([link](https://wiki.debian.org/NetworkConfiguration#Using_DHCP_to_automatically_configure_the_interface))

```
cp /etc/network/interfaces /etc/network/interfaces.bu
vi /etc/network/interfaces
```
### Static IP

Update the ip address of either eth0 or eth1 appropriately

### DHCP 

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

Follow these steps: [Install Azure IoT Edge runtime on Linux (ARM32v7/armhf)](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux-arm).  

As Debian 8 is not a supported OS for the default install, further steps are required.

* Download this file to your computer.  To get the latest release, you will need to pull the IoT Edge code and recompile.
