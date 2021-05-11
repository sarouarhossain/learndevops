Get Labels
```
kubectl get nodes --show-labels
```

Get All pods with node info where it is running 
```
kubectl get pod -o wide
```

To run a pod in a specific node, we need to add node selector and add labels
```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
    - name: nginx
      image: nginx
  nodeSelector:
    disk: ssd
```

port -forward
```
kubectl port-forward pod_name port_where_to_forward:port_in_pod
```