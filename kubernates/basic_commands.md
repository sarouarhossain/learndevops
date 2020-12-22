##Install minikube and kubectl
-------------------------------
* ***brew install hyperkit***
* ***brew install minikube***
* ***minikube***
  
##Start minikube
------------------------
It needs virtual machine or docker 
***minikube start --vm-driver=hyperkit***

##Basic commands
--------------------
* ***kubectl get nodes***
* ***minikube status***
* ***kubectl status***
* ***kubectl get pod***
* ***kubectl get services***
* ***kubectl create -h*** to get help

##Create a deployment
------------------------
* ***kubectl create deployment ngnix-depl --image=ngnix***
* ***kubectl get deployment***
* ***kubectl get pod***
* ***kubectl get replicaset***
* ***kubectl edit deployment ngnix-depl***
* ***kubectl logs pod_name***
* ***kubectl describe pod pod_name***