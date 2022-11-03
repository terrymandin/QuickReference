# Kubernetes

## Commands

```
# Log in to regisry
az acr login --name <registry-name>

# Push image to registry
docker tag mcr.microsoft.com/hello-world <login-server>/hello-world:v1
docker push <login-server>/hellow-world:v1

# List container images
az acr repository list --name <registry-name> --output table

kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml config current-context
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get nodes
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml config get-contexts
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml config get-users 
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get namespaces
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get all --all-namespaces
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml create -f pod-definition.yml
kubectl --kubeconfig c:/k8s/quickstart-azure-custom.yaml get pods

```

## K3S

- Made by Rancher
- Susinct version of Kubernetes

## nginx

```
kubectl --kubeconfig quickstart-azure-custom.yaml run nginx --image=nginx
kubectl --kubeconfig quickstart-azure-custom.yaml describe pods nginx
kubectl --kubeconfig quickstart-azure-custom.yaml logs nginx 
kubectl --kubeconfig quickstart-azure-custom.yaml get pods -o wide
kubectl --kubeconfig quickstart-azure-custom.yaml delete pod nginx
```

## Manifest file
```
kubectl --kubeconfig quickstart-azure-custom.yaml create -f pod-definition.yml
```

## Scale
```
kubectl --kubeconfig quickstart-azure-custom.yaml scale --replicas=5 deployment myapp-deployment
```

## Sample Deployment Simple
```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp    
spec:
  containers:
  - name: nginx-container
    image: nginx
    ports:
    - containerPort: 80
```
    

## Sample Deployment More Complex
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-deployment
  labels:
    app: myapp
    type: front-end

spec:
  template:
    metadata: 
      name: myapp-pod
      labels:
        app: myapp
    spec:
      containers:
        - name: nginx-container
          image: nginx
          ports:
          - containerPort: 80

  replicas: 3

  selector:
    matchLabels:
      app: myapp
```

## Sample Deployment ClusterIP Service
```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service-ci

spec:
  type: ClusterIP
  ports:
    - targetPort: 80
      port: 80      
  
  selector: 
    app: myapp
```

## Sample Deployment NodePort Service
```
apiVersion: v1
kind: Service
metadata:
  name: myapp-service-np

spec:
  type: NodePort
  ports:
    - targetPort: 80
      port: 80
      nodePort: 30008
  
  selector: 
    app: myapp
```

## Busybox
```
apiVersion: v1
kind: Pod
metadata:
  name: multi-busybox
spec:
  containers:
  - name: busybox
    image: busybox        
    command: ['sh', '-c', 'echo busybox1 is Running ; sleep 60000']
  - name: nginx
    image: nginx
    ports:
      - containerPort: 80
```
