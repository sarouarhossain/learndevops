`kubectl create -h`  
`kubectl create -f FILENAME`  
`kubectl apply -f FILENAME`  
`kubectl create deployment nginx-deployment nginx-depl --image=nginx`  
`kubectl get replicaset`  
`kubectl exec -it POD_NAME -- bin/bash`  
`kubectl delete deployment DEPLOYMENT_NAME`  
`kubectl apply -f FILE_NAME`  

`kubectl get all`
`kubectl get all | grep mongodb`

`minikube dashboard`  
`minikube dashboard --url`  
`minikube service nginx-service`

### base64 encoding
`echo -n 'data' | base64`