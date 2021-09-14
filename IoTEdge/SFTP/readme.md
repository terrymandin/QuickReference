# Setup SFTP in an Edge Module

1. Image
   ```
   atmoz/sftp
   ```
2. Create Options
   ```
   {
      "Cmd": [
          "foo:pass:::upload"
      ],
      "HostConfig": {
          "Binds": [
              "<local directory>:/home/foo/upload"
          ],
          "PortBindings": {
              "22/tcp": [
                {
                  "HostPort": "24"
                }
              ]
          }
      }
   }
   ```
3. Open port
   ```
   ufw enable
   ufw allow 24
   ```
5. Call SFTP
   ```
   sftp -P 24 foo@<ipaddress>
   ```
