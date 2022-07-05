# Configuring IoT Edge Nested Edge between two EFLOW Devices

## Overview

## Steps

### Step 1 - Create installation scripts

* Log into [Azure Bash Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart).
* Extract the nested edge configuration tool to a directory.
``` 
mkdir nestedIotEdgeTutorial
cd ~/nestedIotEdgeTutorial
wget -O iotedge_config.tar "https://github.com/Azure-Samples/iotedge_config_cli/releases/download/latest/iotedge_config_cli.tar.gz"
tar -xvf iotedge_config.tar
```
- Edit the config utility file
```
code ~/nestedIotEdgeTutorial/iotedge_config_cli_release/templates/tutorial/iotedge_config.yaml
```
- Update iothub_hostname (hubName.azure-devices.net) and iothub_name (hubName)
- Close the file
- Run the utility
```
mkdir ~/nestedIotEdgeTutorial/iotedge_config_cli_release/outputs
cd ~/nestedIotEdgeTutorial/iotedge_config_cli_release
./iotedge_config --config ~/nestedIotEdgeTutorial/iotedge_config_cli_release/templates/tutorial/iotedge_config.yaml --output ~/nestedIotEdgeTutorial/iotedge_config_cli_release/outputs -f![image](https://user-images.githubusercontent.com/833055/177221020-5d91e2a5-8b40-4790-8cdf-0c02e40ba088.png)
```
* Explort the following files to your local C: drive
```
~/nestedIotEdgeTutorial/iotedge_config_cli_release/outputs/lower-layer.zip
~/nestedIotEdgeTutorial/iotedge_config_cli_release/outputs/top-layer.zip
```
* Extract the files from each zip file into their own directory
* Edit the ```install.sh``` file in both directories.  
* Replace
```
cp iotedge_config_cli_root.pem /usr/local/share/ca-certificates/iotedge_config_cli_root.pem.crt
update-ca-certificates
```
with
```
cp iotedge_config_cli_root.pem /etc/pki/ca-trust/source/anchors/iotedge_config_cli_root.pem.crt
update-ca-trust

```
* Save the file

### Step 2 - Install EFLOW on the Top device

- Ensure that nested virtualization is enabled on the VM.  If the device is in a VM open PowerShell in admin mode and run the following while the VM is not running
```
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
```
* Create an external switch in Hyper-V
  - Open Hyper-V.  
  - Under "Actions" select "Virtual Switch Manager..."
  - Choose "External"
  - Click on "Create Virtual Switch"
  - Give your switch a name.  e.g. "EFLOW"
  - Click on "External network"
  - Under "External network", choose the network you are currently using
  - Enable the "Allow management operating system to share this network adapter" check box
  - Leave all of the other defaults
  - Click "Apply"
  - Click "OK"
* Install EFLOW 
  - Steps below are from [Create and provision an IoT Edge for Linux on Windows device using symmetric keys](https://docs.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-on-windows-symmetric?view=iotedge-2020-11&tabs=azure-portal%2Cpowershell)
  - Open PowerShell in admin mode
  - Enable Hyper-V
    ```
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All)
    ```
  - Check if local mashin is AllSigned
    ```
    Get-ExecutionPolicy -List
    ```
  - If not run the following
    ```
    Set-ExecutionPolicy -ExecutionPolicy AllSigned -Force
    ```
  - Update the script below to include the name of the external switch you created (replace ExternalSwitchName), then run the script
    ```
    $msiPath = $([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest "https://aka.ms/AzEFLOWMSI-CR-X64" -OutFile $msiPath

    Start-Process -Wait msiexec -ArgumentList "/i","$([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))","/qn"![image](https://user-images.githubusercontent.com/833055/177223634-d80bf9b9-4155-459b-aa0e-0595a19b732d.png)
    Deploy-Eflow -vSwitchType "External" -vSwitchName "ExternalSwitchName"
    ```
* Configure EFLOW
  - Copy the files from the "top level" directory created in Step 1 to the local machine
  - Change directory in PowerShell to the directory where the files are located
  - Copy the files into the EFLOW Mariner VM
    ```
    Copy-EflowVmFile -fromFile *.* -tofile ~/ -pushFile
    ```
  - Start an SSH session in the Mariner VM
    ```
    Connect-EflowVm
    ```
  - Create the following directory
    ```
    sudo mkdir /etc/ca-certificates
    sudo chmod 755 /etc/ca-certificates
    ```
  - Update the permissions on the ```install.sh``` file
    ```
    sudo chmod 755 install.sh
    ```
  - Run install.sh
    ```
    sudo ./install.sh
    ```
  - Provide the current computer's IP address when prompted for the Host name
  - Edit the config.toml file
    ```
    sudo vi /etc/aziot/config.toml
    ```
  - Replace the following
    ```
    ```


  

