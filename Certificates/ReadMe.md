# Certificates

- Create a key
```
openssl genrsa -out <name>.key 2048
```
- Create Certificate Signing Request (CSR)
```
openssl req -new -key apiserver.key -subj "/CN=<CNname>" -out <name>.csr
```
- Sign Certificate
```
openssl x509 -req -in <name>.csr -CA ca.crt -CAkey ca.key -out <name>.crt
```
- View a Certificate
```
openssl x509 -in <path>/<certname>.crt -text -noout
```
