##Install minikube and kubectl
-------------------------------
####Mac OS
* ***brew install hyperkit***
* ***brew install minikube***
* ***minikube***

####Ubuntu OS
* ***curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb*** to install minikube
* ***sudo dpkg -i minikube_latest_amd64.deb***
* ***curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"*** to install kubectl
* ***chmod +x ./kubectl***
* ***sudo mv ./kubectl /usr/local/bin/kubectl***
* ***sudo apt-t get install -y virtualbox*** if you wanna use virtual box as base. You can also use docker as base.

####Start minikube
It needs virtual machine or docker 
***minikube start --vm-driver=hyperkit*** We can use virtual box instead of hyperkit
***minikube start --driver=docker*** if we want to use docker as base driver 

##Basic commands
--------------------
* ***kubectl get nodes***
* ***minikube status***
* ***kubectl get pod***
* ***kubectl get services***
* ***kubectl create -h*** to get help

####Create a deployment
* ***kubectl create deployment ngnix-depl --image=ngnix***
* ***kubectl get deployment***
* ***kubectl get pod***
* ***kubectl get replicaset***
* ***kubectl edit deployment ngnix-depl***
* ***kubectl logs pod_name***
* ***kubectl describe pod pod_name***