### Namespaces
`kubectl get namespaces`  
`kubectl create ns namespace_name`  

### Nodes
`kubectl get nodes`  
`kubectl describe node node_name`

### Pods
`kubectl get pods` 
`kubectl get pods -n name_space_name`  
`kubectl get pods -n kube-system`  
`kubectl get pods -n default` 
`kubectl get pod pod_name -o yaml`    

`kubectl create -f pod_name.yml -n namespace_name`  
`kubectl apply` -> after changing the pod config yml file.  
`kubectl edit pod pod_name -n namespace_name` -> after save auto apply.  
`kubectl delete pod pod_name -n namespace_name`  

`kubectl logs pod_name -n namespace_name`  

`kubectl exec my-configmap-volume-pod -n my-ns -- commands`

### ConfigMap
key:vale configuration data  
`kubectl apply -f config_map_file.yml -n namespace_name`  
`kubectl get configmap -n namespace_name`  
`kubectl delete configmap configmap_name -n namespace_name`  

There is a option called config map mounted volume.  


