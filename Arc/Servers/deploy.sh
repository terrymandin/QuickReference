#Variables
user="azurearc"
password='LearnArc123!'
location="southcentralus" #"westus"

#Ask for the IP Address so we can define nsg rules.
#read -p "What's your IP Address (https://whatismyipaddress.com/): " ipaddress

rand=$((100 + $RANDOM % 1000))

az config set extension.use_dynamic_install=yes_without_prompt

#Enable azure resource providers.
az provider register --namespace 'Microsoft.HybridCompute' --wait
az provider register --namespace 'Microsoft.GuestConfiguration' --wait
az provider register --namespace 'Microsoft.HybridConnectivity' --wait
az provider register --namespace 'Microsoft.Insights' --wait
az provider register --namespace 'Microsoft.Kubernetes' --wait
az provider register --namespace 'Microsoft.KubernetesConfiguration' --wait
az provider register --namespace 'Microsoft.ExtendedLocation' --wait


#Create a resource group.
azureResourceGroup="arcdemo$rand-azure"
arcResourceGroup="arcdemo$rand-arc"
az group create --name $azureResourceGroup --location $location
az group create --name $arcResourceGroup --location $location

#Create a VNet and NSG rules to open SSH and RDP
az network nsg create --resource-group $azureResourceGroup --name "arcnsg$rand" --location "$location"
#az network nsg rule create --resource-group $azureResourceGroup --nsg-name "arcnsg$rand" --name Allow-SSH-IP --access Allow --protocol Tcp --direction Inbound --priority 300 --source-address-prefix $ipaddress --source-port-range "*" --destination-address-prefix "*" --destination-port-range 22
#az network nsg rule create --resource-group $azureResourceGroup --nsg-name "arcnsg$rand" --name Allow-RDP-IP --access Allow --protocol Tcp --direction Inbound --priority 301 --source-address-prefix $ipaddress --source-port-range "*" --destination-address-prefix "*" --destination-port-range 3389
az network vnet create -g $azureResourceGroup -n "arcvnet$rand" --address-prefix 10.0.0.0/16 --subnet-name default --subnet-prefix 10.0.0.0/24 --network-security-group "arcnsg$rand"

#Create a ubuntu vm and deploy a login script that will stop the azure agents and enable the firewall on the vm to prevent it from communicating with the Azure Instance Metadata Service (IMDS)
#NOTE: Use Ubuntu 18 on Azure.  The DependencyAgent Extension that installs when you enable Insights in Arc fails on a Ubuntu 20 Azure VM
#ubuntuimage="Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest" 
ubuntuimage="Canonical:UbuntuServer:18.04-LTS:latest"
az vm create --resource-group $azureResourceGroup --name "arcubuntuvm$rand" --image $ubuntuimage --admin-username $user --admin-password $password --size Standard_D4s_v3 --vnet-name "arcvnet$rand" --subnet "default" --nsg "" --public-ip-address-allocation static
wget https://raw.githubusercontent.com/terrymandin/QuickReference/master/Arc/Servers/ubuntu.sh
az vm run-command invoke -g $azureResourceGroup -n "arcubuntuvm$rand" --command-id RunShellScript \
    --scripts @ubuntulogin.sh \
    --parameters "$user arcubuntuvm$rand"
rm ubuntulogin.sh

#Create a windows vm and deploy a login script that will stop the azure agents and enable the firewall on the vm to prevent it from communicating with the Azure Instance Metadata Service (IMDS)
windowsimage="MicrosoftWindowsServer:WindowsServer:2022-Datacenter:latest"
az vm create --resource-group $azureResourceGroup --name "arcwinvm$rand" --image $windowsimage --admin-username $user --admin-password $password --size Standard_D4s_v3 --vnet-name "arcvnet$rand" --subnet "default" --nsg "" --public-ip-address-allocation static
wget https://raw.githubusercontent.com/terrymandin/QuickReference/master/Arc/Servers/windows.ps1
az vm run-command invoke  --command-id RunPowerShellScript --name "arcwinvm$rand" -g $azureResourceGroup  \
    --scripts @windowslogin.ps1 \
    --parameters "adminUserName=$user"
rm windowslogin.ps1

#Create a 1 node AKS instance.
#az aks create -g $azureResourceGroup -n arcaks$rand -u $user --node-count 1 --generate-ssh-keys --node-vm-size Standard_DS2_v2

#Create an instance of log analytics and azure automation to speed arc setup by the user.
#az monitor log-analytics workspace create -g $arcResourceGroup -n "arcworkspace$rand"
#az automation account create --automation-account-name "arcautomation$rand" --resource-group $arcResourceGroup
