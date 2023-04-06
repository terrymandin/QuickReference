# Terry's Azure VM Quick Reference

* See available images
  ``` 
  az vm image list -o table
  ```
* See Ubuntu 14.04 images
  ```
  az vm image list --all -f ubuntu-14-04 -o table
  ```
* See canonical Ubuntu images
  ```
  az vm image list --all --publisher canonical -o table
  ```
* List SKUs
  ```
  az vm image list-skus --location westus --publisher Canonical --offer UbuntuServer --output table
  ```
* List Images
  ```
  az vm image list --location westus --publisher Canonical --offer UbuntuServer --sku 16.04-LTS --all --output table
  ```
* Create a VM (bash)
  ```
  ResourceGroupName='<resource-group>'
  VMName=<VM-name>
  az vm create \
    --resource-group $ResourceGroupName \
    --name $VMName \
    --image Canonical:UbuntuServer:16.04-LTS:16.04.201812230 \
    --admin-username <username> \
    --admin-password '<Password>'
  ```
* Delete a VM
  ```
  az vm delete --no-wait -y --resource-group <resource-group> --name <VM-name> 
  ```
* Expand Disk size
  - In the portal, Click on the "Disks" blade in the VM
  - Click on the disk
  - Click on "Size + Performance"
  - Enter the new size
  - Click on "Resize"
* Deploy using an ARM Template
  - [How to use Azure Resource Manager (ARM) deployment templates with Azure CLI](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli#deployment-scope)
  ```
  az deployment group create --resource-group <resource-group-name> --template-file <path-to-template>
  ```
