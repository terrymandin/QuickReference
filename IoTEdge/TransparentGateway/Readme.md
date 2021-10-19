# Azure IoT Edge Transparent Gateway
- Set Hostname in config.toml to FQDN
- Remove all files from:
  - /var/lib/aziot/keyd/keys
  - /var/lib/aziot/certd/certs
  - Test with Openssl s_client -showcerts -connect <FQDN>:8883
