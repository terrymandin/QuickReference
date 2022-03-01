# IoT Edge Quick Reference

## Deploy from a manifest
```
az iot edge set-modules --device-id <device id> --hub-name <Iot Hub Name> --content <filename>
```
## Change the protocol / port
Set the "UpstreamProtocol" environment variable for both the edgeAgent and edgeHub to one of the following:
- MQTT
- AMQP
- MQTTWS
- AMQPWS
See: [Choose upstream protocol](https://docs.microsoft.com/en-us/azure/iot-edge/production-checklist?view=iotedge-2020-11#choose-upstream-protocol) for details
