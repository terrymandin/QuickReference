# Terry's Quick Reference for installing IoT Edge on a Moxa-8112-ME-T device

## Configure Moxa device to be DHCP on LAN 1 

```bash
cp /etc/network/interfaces /etc/network/interfaces.bu
vi /etc/network/interfaces
```
### Static IP

Update the ip address of either eth0 or eth1 appropriately

### DHCP ([link](https://wiki.debian.org/NetworkConfiguration#Using_DHCP_to_automatically_configure_the_interface))

Comment out these lines:

```
#iface eth0 inet static
#        address 192.168.3.127
#        network 192.168.3.0
#        netmask 255.255.255.0
#        broadcast 192.168.3.255
```

Add the following:
```
allow-hotplug eth0
iface eth0 inet dhcp
```

To get the DHCP IP address you will need to log in on the static IP address. I used a spare WIFI router I had lying around to do this.  Don't configure both ports to use DHCP or you won't know which IP to log into.

## Install IoT Edge on Moxa device

Install curl
```
apt-get update
apt-get install curl
```

Follow these steps: [Install Azure IoT Edge runtime on Linux (ARM32v7/armhf)](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux-arm).  <b>Note that IoT Edge will not start up as per these instructions.  Steps below will resolve the issue.</b>

Update the config.yaml file as follows

```
hostname: "<IoTHubName>.azure-devices.net"
```

As Debian 8 is not a supported OS for the default install, further steps are required.

* Download this [file](/Devices/Moxa/iotedged-debian8-arm32v7.zip) to your computer.  To get the latest release, you will need to pull the IoT Edge code and recompile.
* Unzip the file and copy the .deb files to the Moxa device
* Run the following commands on the Moxa device.  When prompted, overwrite the "config.yaml" file.
  ```bash
  sudo dpkg -i iotedge_1.0.5-1_armhf.deb
  sudo apt-get install -f
  sudo dpkg -i libiothsm-std_1.0.519373176-1_armhf.deb
  sudo apt-get install -f
  ```
* Update "config.yaml" with your connection string again.
* Restart IoT Edge
  ```bash
  sudo systemctl restart iotedge
  ```
* Check IoT Edge status
  ```bash
  systemctl status iotedge
  ```
* Check IoT Edge logs.  There should be no errors.
  ```bash
  journalctl -u iotedge --no-pager --no-full
  ```
* Check that the Edge agent is running
  ```bash
  sudo iotedge list
  ```
