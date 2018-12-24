# Terry's VM Quick Reference

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
* Create a VM (bash)
  ```
  ResourceGroupName=TMTraining
  VMName=TMUbuntuVM
  AdminPassword==123!@#Pass
  az vm create \
    --resource-group $ResourceGroupName \
    --name $VMName \
    --image win2016datacenter \
    --admin-username azureuser \
    --admin-password $AdminPassword
  ```
