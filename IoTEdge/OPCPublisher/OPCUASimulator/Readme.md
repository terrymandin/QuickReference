# Steps for setting up an OPC UA Container based simulator
```
docker pull mcr.microsoft.com/iotedge/opc-plc:latest
docker run --rm -it -p 50000:50000 -p 8080:8080 --name opcplc mcr.microsoft.com/iotedge/opc-plc:latest --pn=50000 --autoaccept --sph --sn=5 --sr=10 --st=uint --fn=5 --fr=1 --ft=uint --ctb --scn --lid --lsn --ref --gn=5
```
