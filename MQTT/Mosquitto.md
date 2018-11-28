# Mosquitto MQTT Quick Reference

## Create an Ubuntu 16.04 Linux VM

* Open the Azure Portal.  https://portal.azure.com/
* Click on "+ Create a Resource" in the top left
* In the "Search the Marketplace" box, enter "Ubuntu Server 16.04 LTS"
* Choose the canonical "Ubuntu Server 16.04 LTS" server.  Build the VM as you normally would, except in the following areas:
  * Basics. Enter fields as normal. Use password authentication.  Click "Next: Disks".
  * Disks. Accept defaults.  Standard HDD is fine if you want to save a little money.  Click "Next: Networking".
  * Networking.  Choose "Allow Selected Ports".  Select "SSH (22)".  Click "Next: Management".
  * Tags. Accept defaults. Click 
* Wait for the VM to deploy.
* Open Port 1883 inbound on the VM.
  * Go to the "Networking" setting for the VM.
  * Create a new inbound port rule to allow inbound traffic on Port 1883

## Install Mosquitto

* Install from [here](https://mosquitto.org/download/)
  * Ubuntu 16.04 instructions:
    ```
    sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
    sudo apt-get update
    apt install mosquitto
    ```
* [Start Mosquitto](https://mosquitto.org/man/mosquitto-8.html)
  ```
  mosquito -c <config-file> -v
  ```
* Stop Mosquitto
  ```
  sudo service stop mosquitto
  ```
* Start Mosquitto
  ```
  sudo service start mosquitto
  ```
## Updating the configuration file

* The configuration file is located here: /etc/mosquitto/mosquitto.conf
