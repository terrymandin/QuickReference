# Nested Edge Configuration

## Parent TOML
```
hostname = "<IPOfDevice>"
trust_bundle_cert = "file:///IoTEdgeCerts/azure-iot-test-only.root.ca.cert.pem"

[provisioning]
source = "manual"
connection_string = "HostName=<IoTHubName>.azure-devices.net;DeviceId=<DeviceName>;SharedAccessKey=<key>"

[edge_ca]
cert = "file:///IoTEdgeCerts/iot-edge-device-ca-<ParentDeviceName>-full-chain.cert.pem"
pk = "file:///IoTEdgeCerts/iot-edge-device-ca-<ParentDeviceName>.key.pem"
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
cert = "file:///IoTEdgeCerts/iot-edge-device-ca-<ChildDeviceName>-full-chain.cert.pem"
pk = "file:///IoTEdgeCerts/iot-edge-device-ca-<ChildDeviceName>.key.pem"
```
