# RHEL Install

# RHEL 7.9
## Go here and look through latest releases: 
- https://github.com/Azure/azure-iotedge/tags
- https://packages.microsoft.com/config/rhel/
- https://packages.microsoft.com/centos/7/prod/

## Prerequisites
#### RHEL 7.9
1. Go to Home in Portal
2. Click on "+ Create a New Resource"
3. In "Search" type in "Red Hat"
4. Choose Red Hat v7.9

# Steps

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

# CONFIGURATION REQUIRED HERE
sudo iotedge config mp --connection-string 'PASTE_DEVICE_CONNECTION_STRING_HERE'

sudo systemctl enable aziot-edged.service
sudo systemctl enable aziot-keyd.service
sudo systemctl enable aziot-certd.service
sudo systemctl enable aziot-identityd.service
sudo systemctl enable aziot-tpmd.service

iotedge config apply
```
