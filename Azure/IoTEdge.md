# Terry's IoT Edge Quick Reference

## Build a VM with Edge installed
```bash
az vm create \
  --no-wait \
  --resource-group <resourceGroupName> \
  --name <VMName> \
  --image microsoft_iot_edge:iot_edge_vm_ubuntu:ubuntu_1604_edgeruntimeonly:1.0.1 \
  --admin-username <username> \
  --admin-password '<Password>'
```
