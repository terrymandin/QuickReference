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
* Edit the ```install.sh``` file in both directories (ie. for both the top level and the lower level).  
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
* Edit the config.toml file
* Replace the following
  ```
  [listen]
  workload_uri = "fd://aziot-edged.workload.socket"
  management_uri = "fd://aziot-edged.mgmt.socket"
  ```
  with
  ```
  [listen]
  workload_uri = "unix:///var/run/iotedge/workload.sock"
  management_uri = "unix:///var/run/iotedge/mgmt.sock"
  ```
* Save and close the file

### Step 2 - Setup networking

* Create an External Switch on the Top Computer
  - On the top computer open Hyper-V.  
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
* Open Ports
  - On the **top computer** open the following ports
    ```
    sudo iptables -A INPUT -p tcp --dport 5671 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 8883 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    ```
  - To allow pings on the **top computer** allow ICMP messages
    ```
    sudo iptables -A INPUT -p icmp --icmp-type 8 -s 0/0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
    ```
  - To make the simulation module work on the **lower computer** open the AMQP port
    ```
    sudo iptables -A INPUT -p tcp --dport 5671 -j ACCEPT
    ```
* Test connectivity from the lower device to the top device using a ping
  ```
  ping x.x.x.x
  ```
### Step 3 - Install EFLOW on both devices

Complete the following steps on both devices.
* Ensure that nested virtualization is enabled on the VM.  If the device is in a VM open PowerShell in admin mode and run the following while the VM is not running
  ```
  Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true
  ```
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
    
    $msiPath = $([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest "https://aka.ms/AzEFLOWMSI-CR-X64" -OutFile $msiPath

    Start-Process -Wait msiexec -ArgumentList "/i","$([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))","/qn"![image](https://user-images.githubusercontent.com/833055/177223634-d80bf9b9-4155-459b-aa0e-0595a19b732d.png)
    ```
  - On the **top device**, specify the switch that was created in Step 2.  Please insert the name of your external switch in the snippet below
    ```
    Deploy-Eflow -vSwitchType "External" -vSwitchName "ExternalSwitchName"
    ```
  - On the **lower device** no parameters are necessary
    ```
    Deploy-Eflow
    ```
* Configure EFLOW
  - Copy the appropriate files (top or lower) from Step 1 to the local machine's C: drive
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
    - If the device is the **lower device** then provide the ip address of the parent device
  - Run the following Linux commands to create required directories and set permissions
    ```
    sudo mkdir /var/run/iotedge
    sudo chmod 777 /var/run/iotedge
    sudo chown iotedge /var/run/iotedge
    sudo chmod 777 /etc/aziot/certificates -R![image](https://user-images.githubusercontent.com/833055/177369825-6cb43cf0-46f8-48c7-b154-c38af329e73f.png)
    ```
  - Apply the configuration changes
    ```
    sudo iotedge config apply
    ```
## Step 4 - Confirm everything is working properly

* On the **top computer** perform the following checks
  ```
  # Perform an IoT Edge check
  sudo iotedge check
  
  # Confirm all modules are running.  You should see:
  #   - edgeAgent
  #   - edgeHub
  #   - registry
  #   - IoTEdgeAPIProxy
  docker ps
  
  # Check the logs for all of the modules.  (This can also be done in the portal)
  docker logs edgeAgent
  docker logs edgeHub
  docker logs restistry
  docker logs IoTEdgeAPIProxy
  ```

## That's it - all done!
