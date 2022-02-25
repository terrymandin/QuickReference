# Store IOT Edge Files on Host OS

## Steps
- On the Device
  - sudo su
  - Create a directory on your device. eg. /etc/aziot/storage
  - chown $( whoami ):iotedge /etc/aziot/storage/1. 
  - chmod 775 /etc/iotedge/storage/
- In IoT Hub in the portal
  - Go to your edge device
  - Choose "Set Modules"
  - Choose "Runtime Settings"
  - For both "Edge Agent" and "Edge Hub"
    - Create Environment Variable: storageFolder, Text, /iotedge/storage/
    - Add "Binds" node to "Container Create Options":
    ```
    {
        "HostConfig": {
            "Binds": [
                "/etc/aziot/storage/:/iotedge/storage/"
            ]
        }
    }
    ```
  - "Review and Create"
  - "Create"
