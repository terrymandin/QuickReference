# Terry's Modbus Quick Reference for installing IoT Edge on a Moxa-8112-ME-T device

## Configure Moxa device to be DHCP on LAN 1 ([link](https://wiki.debian.org/NetworkConfiguration#Using_DHCP_to_automatically_configure_the_interface))

```bash
cp /etc/network/interfaces /etc/network/interfaces.bu
vi /etc/network/interfaces
```
### Static IP

Update the ip address of either eth0 or eth1 appropriately

### DHCP 

Add the following:
```bash
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

Follow these steps: [Install Azure IoT Edge runtime on Linux (ARM32v7/armhf)](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-install-iot-edge-linux-arm).  <b>Note that IoT Edge will not start up as per these instructions.  Steps below will resolve the issue.</b>

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
* Update "config.yaml" with your connections string again.
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
