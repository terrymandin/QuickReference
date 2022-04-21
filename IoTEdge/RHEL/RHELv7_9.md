# IoT Edge Install on RHEL

## RHEL 7.9
### Go here and look through latest releases: 
- https://github.com/Azure/azure-iotedge/tags
- https://packages.microsoft.com/config/rhel/
- https://packages.microsoft.com/centos/7/prod/

### Prerequisites
#### RHEL 7.9
1. Go to Home in Portal
2. Click on "+ Create a New Resource"
3. In "Search" type in "Red Hat"
4. Choose Red Hat v7.9

#### Configure "Edge" device in IoT Hub
- Set edgeAgent and edgeHub to version 1.2

### Steps
#### Download files

Option 1 - Use this option if "wget" is installed

```
sudo su
wget https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
wget https://github.com/Azure/azure-iotedge/releases/download/1.2.9/aziot-identity-service-1.2.6-1.x86_64.rpm
wget https://github.com/Azure/azure-iotedge/releases/download/1.2.9/aziot-edge-1.2.9-1.el7.x86_64.rpm -o aziot-edge.rpm
```

Option 2 - "wget" is not installed

```
sudo su
curl -L https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm -o packages-microsoft-prod.rpm
curl -L https://github.com/Azure/azure-iotedge/releases/download/1.2.9/aziot-identity-service-1.2.6-1.x86_64.rpm -o aziot-identity-service.rpm
curl -L https://github.com/Azure/azure-iotedge/releases/download/1.2.9/aziot-edge-1.2.9-1.el7.x86_64.rpm -o aziot-edge.rpm
```
#### Install packages

```
sudo yum install -y ./packages-microsoft-prod.rpm
sudo yum install -y moby-engine
sudo yum install -y moby-cli
sudo yum install -y ./aziot-identity-service.rpm
sudo yum install -y ./aziot-edge.rpm
```

#### Configure IOT Edge
```
sudo iotedge config mp --connection-string 'PASTE_DEVICE_CONNECTION_STRING_HERE'
```
#### Enable services
```
sudo systemctl enable aziot-edged.service
sudo systemctl enable aziot-keyd.service
sudo systemctl enable aziot-certd.service
sudo systemctl enable aziot-identityd.service
sudo systemctl enable aziot-tpmd.service

iotedge config apply
```

## RHEL 8.x
See [IoT Edge Redhat 8 Installation Steps](https://github.com/ms-vincent/IoT-Edge-Redhat-8-Installation-Steps)
