### Namespaces
`kubectl get namespaces`  
`kubectl create ns namespace_name`  

### Nodes
`kubectl get nodes`  
`kubectl describe node node_name`

### Pods
`kubectl get pods` 
`kubectl get pods -n name_space_name`  
`kubectl get pods --all-namespaces`  
`kubectl get pods --show-labels`  
`kubectl get pods -n kube-system`  
`kubectl get pods -n default` 
`kubectl get pod pod_name -o yaml`   
`kubectl get pods -w`   

`kubectl create -f pod_name.yml -n namespace_name`  
`kubectl apply` -> after changing the pod config yml file.  
`kubectl edit pod pod_name -n namespace_name` -> after save auto apply.  

`kubectl describe pod pod_name -n name_space`  
`kubectl delete pod pod_name -n namespace_name`  
`kubectl delete pod pod_name --now -n namespace_name`  

`kubectl logs pod_name -n namespace_name`  

`kubectl exec my-configmap-volume-pod -n my-ns -- commands`  

`kubectl get pod pod_name -n namespace_name -o yaml`

### ConfigMap
key:vale configuration data  
`kubectl apply -f config_map_file.yml -n namespace_name`  
`kubectl get configmap -n namespace_name`  
`kubectl delete configmap configmap_name -n namespace_name`  

There is a option called config map mounted volume.  

`kubectl exec my-securitycontext-pod -n my-ns -- ps` -> to see the running commands inside pod

### ResourceRequest 
```
resources:
    requests:
    memory: "64Mi"
    cpu: "250m"
    limits:
    memory: "128Mi"
    cpu: "500m"
```

### Secrets
`kubectl get secrets -n namespace_name`  
`kubectl apply -f my-secret.yml`

```
env:
- name: MY_PASSWORD
    valueFrom: 
    secretKeyRef:
        name: my-secret
        key: myKey
```

### Service Accounts 
`kubectl create serviceaccount my-serviceaccount -n namespace_name`  
`kubectl get serviceaccounts -n namespace_name`  

### Multi Container Pod
3 ways they can interact with each other 
* Shared network (using http://localhost:port)
* Shared Storage Volume
* Shared Process Namespace -> `shareProcessNamespace: true` in the pod spec

MultiContainer Pod design pattern:
* Sidecar Pod
* Ambassador Pod
* Adapter Pod

### Pod IP
`kubectl get pod fruit-service -o=custom-columns=IP:.status.podIP --no-headers`  

### Liveness and Readiness Probes
* Liveness probe -> indicates whether container is running properly and governs when the cluster will automatically stop or restart the container.  
* Readiness probe -> indicates whether the container is ready to service requests, and governs whether requests will be forwarded to the Pod.

### Metrics Server
`cd ~/`  
`git clone https://github.com/linuxacademy/metrics-server`  
`kubectl apply -f ~/metrics-server/deploy/1.8+/`  
`kubectl get--raw /apis/metrics.k8s.io/`  

### Selectors
`kubectl get pods -l app=my-app`  
`kubectl get pods -l environment!=production,app=my-app1 --show-labels`  
`kubectl get pods -l 'environment in (production,development)' --show-labels`  

### Annotations 

### Deployments
`kubectl get deployments`  
`kubectl edit deployment nginx-deployment`  

### Rolling Updates
`kubectl set image deployment/deployment_name ngnix-container=nginx:1.20.0 --record`  
`kubectl rollout history deployment/deployment_name`  
`kubectl rollout history deployment/deployment_name --revision=4`  
`kubectl rollout undo deployment/deployment_name`  
`kubectl rollout undo deployment/deployment_name --to-revision=3`  
`kubectl rollout status deployment/deployment_name`

maxSurge and maxUnavailable

##### nginx deployment
```
apiVersion: apps/v1
kind: Deployment
metadata: 
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app
  template:
    metadata:
      labels:
        app: nginx-app
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80    
```

### Jobs and CronJobs
`kubectl get jobs`  
`kubectl get jobs -w`  
`kubectl get cronjobs`

##### job pi.yml
```
apiVersion: batch/v1
kind: Job
metadata:
  name: pi-job
spec:
  template:
    spec:
      containers:
      - name: pi-container
        image: perl
        command: ["perl", "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4  
```

##### cronjob hello.yml
```
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello-container
            image: busybox
            args:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes Cluster 
          restartPolicy: OnFailure  

```


