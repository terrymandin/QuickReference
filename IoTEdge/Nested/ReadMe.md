# Nested Edge Configuration

[Kevin Hilcher's documentation](https://github.com/Azure/CertsForIoT-B)

Use this command to test.  Look for SANS
```
echo | \
    openssl s_client -connect 10.0.0.9:8883 2>/dev/null | \
    openssl x509 -text
```
Make sure this is pointing to the parent's IP:
```
X509v3 Subject Alternative Name:
DNS:iotedgeapiproxy, IP Address:20.81.164.227
```

This documentation sets things up for you: [Tutorial: Create a hierarchy of IoT Edge devices](https://docs.microsoft.com/en-us/azure/iot-edge/tutorial-nested-iot-edge?view=iotedge-2020-11)

## Parent TOML
```
hostname = "<IPOfDevice>"
trust_bundle_cert = "file:///IoTEdgeCerts/azure-iot-test-only.root.ca.cert.pem"

[provisioning]
source = "manual"
connection_string = "HostName=<IoTHubName>.azure-devices.net;DeviceId=<DeviceName>;SharedAccessKey=<key>"

[edge_ca]
cert = "file:///IoTEdgeCerts/iot-edge-device-ca-<CA cert name>-full-chain.cert.pem"
pk = "file:///IoTEdgeCerts/iot-edge-device-ca-<CA cert name>.key.pem"
```

## Child TOML
```
parent_hostname = "<ParentIPAddress>"
trust_bundle_cert = "file:///IoTEdgeCerts/azure-iot-test-only.root.ca.cert.pem"

[agent.config]
image = "<ParentIPAddress>:8000/azureiotedge-agent:1.2.0-rc4"

[provisioning]
source = "manual"
connection_string = "HostName=<IoTHubName>.azure-devices.net;DeviceId=<DeviceName>;SharedAccessKey=<key>"

[edge_ca]
cert = "file:///IoTEdgeCerts/iot-edge-device-ca-<CA cert name>-full-chain.cert.pem"
pk = "file:///IoTEdgeCerts/iot-edge-device-ca-<CA cert name>.key.pem"
```
