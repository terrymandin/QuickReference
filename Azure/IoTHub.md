# Terry's IoT Hub Quick Reference

* Get shared access signature
  ```
  az iot hub generate-sas-token --device-id <device-id> --hub-name <hub-name> --duration 31536000
  ```
* Baltimore Certificate is located [here](https://ssl-tools.net/certificates/d4de20d05e66fc53fe1a50882c78db2852cae474.pem)

* Install az
  * [Install Azure CLI with apt](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest)
  * Install Extension
    ```
    az extension add --name azure-cli-iot-ext
    ```
  * Login
    ```
    az --login
    ```
  * Set Subscription
    ```
    az account set -s <subscription-id>
    ```
