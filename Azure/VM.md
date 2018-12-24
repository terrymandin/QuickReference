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
