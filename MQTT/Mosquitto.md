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

## Updating the configuration file

* The configuration file is located here: /etc/mosquitto/mosquitto.conf
* Baltimore Certificate is located [here](https://ssl-tools.net/certificates/d4de20d05e66fc53fe1a50882c78db2852cae474.pem).  Rename it to DigiCertBaltimoreRoot.crt and place it in /etc/ssl/certs/

```
# Place your local configuration in /etc/mosquitto/conf.d/
#
# A full description of the configuration file is at
# /usr/share/doc/mosquitto/examples/mosquitto.conf.example

allow_anonymous true
log_type all

pid_file /var/run/mosquitto.pid

persistence true
persistence_location /var/lib/mosquitto/

# log_dest file /var/log/mosquitto/mosquitto.log

include_dir /etc/mosquitto/conf.d

# Bridge configuration
connection iothub-bridge
log_type debug
address tm-iot-hub-free.azure-devices.net:8883
remote_username tm-iot-hub-free.azure-devices.net/Mosquitto
# remote_username Mosquitto
remote_password SharedAccessSignature sr=<iot-hub>.azure-devices.net%2Fdevices%2F<device-id>&sig=<key>=1574965068
remote_clientid Mosquitto
bridge_cafile /etc/ssl/certs/DigiCertBaltimoreRoot.crt
try_private false
cleansession true
start_type automatic
bridge_insecure false
bridge_protocol_version mqttv311
bridge_tls_version tlsv1
notifications false
notification_topic events/
topic # out 0 devices/<device-id>/messages/events/ devices/<device-id>/messages/events/
topic # in 0 devices/<device-id>/messages/devicebound/ devices/<device-id>/messages/devicebound/
```
