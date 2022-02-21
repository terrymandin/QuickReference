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

### Steps
#### Install IoT Edge
```
sudo su

wget https://packages.microsoft.com/config/rhel/7.4/packages-microsoft-prod.rpm
wget https://packages.microsoft.com/centos/7/prod/moby-cli-3.0.13%2Bazure-0.x86_64.rpm
wget https://packages.microsoft.com/centos/7/prod/moby-engine-3.0.13%2Bazure-0.x86_64.rpm
wget https://github.com/Azure/azure-iotedge/releases/download/1.2.5/aziot-identity-service-1.2.4-1.x86_64.rpm
wget https://github.com/Azure/azure-iotedge/releases/download/1.2.5/aziot-edge-1.2.5-1.el7.x86_64.rpm

sudo yum install ./packages-microsoft-prod.rpm
sudo yum install moby-cli-3.0.10+azure-0.x86_64.rpm
sudo yum install moby-engine-3.0.10+azure-0.x86_64.rpm
sudo rpm -Uhv aziot-identity-service-1.2.4-1.x86_64.rpm
sudo rpm -Uhv aziot-edge-1.2.5-1.el7.x86_64.rpm
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
