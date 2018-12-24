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
  az vm delete --no-wait -y --resource-group TMTraining --name TMTestARMDeploy > out2.txt 
  ```
