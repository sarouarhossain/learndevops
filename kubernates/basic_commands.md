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

####Start/Stop minikube
It needs virtual machine or docker 
***minikube start --vm-driver=hyperkit*** We can use virtual box instead of hyperkit
***minikube start --driver=docker*** if we want to use docker as base driver
***minikube stop*** 

##Basic commands
--------------------
* ***kubectl get nodes***
* ***minikube status***
* ***kubectl get pod***
* ***kubectl get services***
* ***kubectl create -h*** to get help
* ***kubectl version*** to get the client and server version of kubernates 

####Create a deployment
* create an ngnix deployment
-> ***kubectl create deployment DEPLOYMENT_NAME --image=IMAGE_NAME***
 -> ***kubectl create deployment nginx-depl --image=nginx***
* ***kubectl get deployment***
* ***kubectl get pod***
* ***kubectl get replicaset***
* ***kubectl edit deployment nginx-depl***
* ***kubectl logs POD_NAME***
* ***kubectl describe pod POD_NAME***
* ***kubectl delete pod POD_NAME***
* ***kubectl get pod -n kube-system***
* ***kubectl delete deploy ngnix-depl***