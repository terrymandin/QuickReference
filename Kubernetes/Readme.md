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

## Environemnt Variables

Key/Value stores.  Stored at the pod level.  All containers within the pod can access them
- ConfigMaps
  - Not sensitive.  It can be seen
- Secrets
  - Sensitive data
  - Can be seen within a pod

## Networking

- Multiple implementations.  e.g.:
  - Azure CNI
  - KubeNet (development environments)
- K8S creates the routing within itself
- Dynamic
  - NIC assignment and removal
  - IP assignment and removal
  - Port assignmenbt and removal
- Single CIDR block.  It will be a flat network
- "Allow All" policy.  Everybody can talk to everybody internally and externally
- Needs 3 subnets
  - Master and worker nodes,ie. VMs (external IPs)
  - PODs (internal IPs)
  - Services (Internal IPs)
- Uses Docker Bridge (used for the Pods)
- Load balancer of layer 4.  IP+port

```
kubectl --kubeconfig quickstart-azure-custom.yaml run -i --tty --rm debug --image=busybox --restart=Never -- sh
```

## DNS

- Based on CoreDNS
```
# All of the cluster objects. Filter by coredns
kubectl --kubeconfig quickstart-azure-custom.yaml get all -n kube-system | grep coredns
```

- K8S adds a /etc/resolve.conf file with a nameserver config that points to coredns
- Use the FQDN of the service to communicate
  - pod-ip-address..my-namespace.pod.cluster-deomain.example
  - my-svc.my-namespace.svc.cluster-domain.example

## Networking

- Services loadbalancing access to the pods
- Exposes a Virtual IP address + port
- Service is created in all of the worker nodes
  - Services is a IP TABLE or IPVS.  Basically forwarding rules
- Types of services
  - NodePort
    - Not enough routable IP addresses.  Service IP is not routable outside of K8S.  Customers can't access the service IP.
    - Map service port to a port in this range: 30000 - 32767
    - Just use any of the Worker Node IPs + the port
  - ClusterIP
    - Has a routable IP address
    - default service type

## Ingress

- Expose our service to external custers
- LoadBalancer (cloud)
- Can loadbalance multiple services in it
- Layer 7 load balancer
  - Terminate SSL (encryption)
  - Rewrite rules
  - Affinity rules
  - Reachable URLs
- Typically used with HTTP/HTTPS (TCP or UDP ports can be exposed)
- Not deployed by default
- K8S + 3rd party
  - Ingress resource: object used to configure traffic
    - IP address and which service forwarding traffic
  - Ingress controller (3rd party): compute object that processes the traffic
    - Compute power.  Executing rules.
    - Most commonly used: Nginx, Traefik
