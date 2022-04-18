# IoT Hub Private Link

## Steps
1. Create IoT Hub
1. On the Networking Page, choose "Selected IP Ranges".  Add your PC's IP.  THis will allow you to add/remove/update devices.  I used my IPv4 address.
1. Create a device.  Copy the connection string.
1. Create a VM in the same VNet as the IoT Hub
1. Create a sample program in the VM and updated it to use the connection string from #4 above.  You don’t need to use the private link name.  It is just a name and isn’t really used anywhere.
1. Run your program and not that the messages send.
