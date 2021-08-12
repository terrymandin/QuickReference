# Steps for setting up an OPC UA Container based simulator

See: [OPC PLC server](https://docs.microsoft.com/en-us/samples/azure-samples/iot-edge-opc-plc/azure-iot-sample-opc-ua-server/)
```
docker pull mcr.microsoft.com/iotedge/opc-plc:latest
docker run --rm -it -p 50000:50000 -p 8080:8080 --name opcplc mcr.microsoft.com/iotedge/opc-plc:latest --pn=50000 --autoaccept --sph --sn=5 --sr=10 --st=uint --fn=5 --fr=1 --ft=uint --ctb --scn --lid --lsn --ref --gn=5
```
## Windows
```
dotnet opcplc.dll --pn=50000 --at X509Store --autoaccept --sph --sn=5 --sr=10 --st=uint --fn=5 --fr=1 --ft=uint --ctb --scn --lid --lsn --ref --gn=5
```
