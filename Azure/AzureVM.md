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

  See [Expand virtual hard disks on a Linux VM with the Azure CLI](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/expand-disks)
  ```
  az vm deallocate --resource-group <resourceGroup> --name <vmName>
  az disk list --resource-group <resourceGroup> --query '[*].{Name:name,Gb:diskSizeGb,Tier:accountType}' --output table
  az disk update --resource-group <resourceGroup> --name <diskName> --size-gb 75
  az vm start --resource-group <resourceGroup> --name <vmName>
  az vm show --resource-group <resourceGroup> --name <vmName> -d --query [publicIps] --output tsv
  ```
