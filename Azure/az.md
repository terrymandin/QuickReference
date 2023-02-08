# Az quickstart

## Commands
```
az find <topic>
```

## Deploy ARM Template
```
templateFile="{provide-the-path-to-the-template-file}"
az deployment group create \
  --name blanktemplate \
  --resource-group myResourceGroup \
  --template-file $templateFile
```
