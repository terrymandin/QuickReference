# Terry's IoT Hub Postman Quick Reference

## Prerequisites

- A IoT Hub
- Azure CLI
  - Follow these steps to install the Azure CLI: [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
  - Install the IoT Extension
    ```
    az extension add --name azure-cli-iot-ext
    az extension update --name azure-cli-iot-ext
    ```

## Configure IoT Hub

- Open the [Azure Portal](https://ms.portal.azure.com)
- Click on "IoT Devices"
- Click on "+ Add"
- Enter the name in "Device Id".  This will be referred to as <device-id> later in this document
- Click "Save"

## Generate SAS Token

- Open a command prompt
- Enter the az command line to generate a SAS token for a device
  ```
  az iot hub generate-sas-token --device-id <device-id> --duration 2592000 --hub-name TMIoTHub
  ```
- Save the SAS token for later.  It will look like this:
  ```
  SharedAccessSignature sr=<Iot Hub name>.azure-devices.net%2Fdevices%2F<device-id>&sig=<token>

## Configure Postman

### Environment Variables

```
Variable        Value
=============   ===================================
iothub          <iot hub name>.azure-devices.net
deviceid        <device-id>
sastoken        <SAS token>
```

### URL
```
https://{{iothub}}/devices/{{deviceid}}/messages/events?api-version=2018-06-30
```

### Headers
```
Key             Value
=============   ===================================
Authorization   {{sastoken}}
Content-Type    application/json
```

### Body

- Enter some valid JSON.  eg:
  ```
  { "Test" : "123" }
  ```

### Start monitoring

- Enter the following command to start monitoring your IoT Hub for incoming messages
  ```
  az iot hub monitor-events -n <
  ```

### Make request

- Click on "Send" in Postman
- Confirm that you receive a "204" HTTP Response
- Check the az CLI to see your JSON message received



