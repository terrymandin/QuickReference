# Seeed / Heltec LoRa Solution

- [Quick Start](https://azure.github.io/iotedge-lorawan-starterkit/2.1.0/quickstart/)
  - resetPin: 7
  - spiSpeed: 2
  - spiDev: 2
  - useAzureMonitorOnEdge: true
  - useDiscoveryService: false
  - deployDevice: true
  - edgeGatewayName: unique name
  - stationEui: <as per below>
- Add the following to the /boot/config.txt file
  ```
  [all]
  #dtoverlay=vc4-fkms-v3d
  dtoverlay=spi0-cs,cs1_pin=5
  ```
- Get EUI
  ```
  cat /sys/class/net/eth0/address
	# Assuming aa:bb:cc:00:11:22 is the returned MAC Address
	# your EUI will be AABBCCFFFE001122
  # Please note the insertion of the literals 'FFFE'  in the midde, as per [Basic Station 2.0.6 January 2022 documentation](https://lora-developers.semtech.com/build/software/lora-basics/lora-basics-for-gateways/?url=glossary.html) 
  ```
- Enable SPI on Raspberry PI
- Setup Device
  ![image](https://user-images.githubusercontent.com/833055/187965309-c909f80d-1817-4be5-a4a9-6986c3104329.png)
  - NOTE: Use version 0.0.5 instead or you won't see the region.
  ![image](https://user-images.githubusercontent.com/833055/187964894-9f49c4ac-4bf9-48d7-bb1a-a8fee225ffb4.png)
  - [Get License](https://resource.heltec.cn/search/)
  - In Arduino go to File > Examples > ESP32_LoRaWAN > OTAA_OLED sketch
  - Edit sketch with  License code from Step 9, any unique DevEUI and AppEUI and AppKey from Step 7 (device twin associated with this device)
  - DevEui should match the deviceId in IoThub, just write the deviceId string (e.g. deviceId “2232330000888802”) as hex as below
  - Similarly enter the string AppEui and AppKey as hex (e.g. “70B3D57ED002B18A”)
  - ![image](https://user-images.githubusercontent.com/833055/187964410-4893b3b3-bb34-4e70-b255-2d76bbfe4de7.png)
  ![image](https://user-images.githubusercontent.com/833055/187964757-18f59ccd-2b46-4150-bec2-d382f80ced41.png)

## Troubleshooting
- If station module is not starting, change something in the module twin and re-deploy
- If Arduino cannot see the COM port restart Arduino
