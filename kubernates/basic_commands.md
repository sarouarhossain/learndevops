#####Special Note: All images are taken from the youtube channel ***TechWorld with Nana***(https://tinyurl.com/yxpn5v88) 
***Video Url: https://tinyurl.com/y5bgcn7q***

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

###What is kubectl??
Kubectl is command line tool to communicate with kubernates cluster.

![kubectl](https://user-images.githubusercontent.com/26240597/103598849-f617ec00-4f46-11eb-9dae-eeff4ee351cb.png)

##Basic commands
--------------------
* ***kubectl get nodes***
* ***minikube status***
* ***kubectl get pod***
* ***kubectl get services***
* ***kubectl create -h*** to get help
* ***kubectl version*** to get the client and server version of kubernates 

####Pods
* ***kubectl get pod***
* ***kubectl logs POD_NAME***
* ***kubectl describe pod POD_NAME***
* ***kubectl delete pod POD_NAME***
* ***kubectl get pod -n kube-system***

#####Special Note
-> Deployment for stateless apps
-> StatefulSet for stateful apps or databases

####Deployment
Deployment manages all the replica set. Everything bellow the deployment should be managed automatically by kubenates.
* ***kubectl create deployment DEPLOYMENT_NAME --image=IMAGE_NAME***
* create an ngnix deployment
 -> ***kubectl create deployment nginx-depl --image=nginx***
* create an mongo deployment
 -> ***kubectl create deployment mongo-depl --image=mongo***
* ***kubectl get deployment***
* ***kubectl delete deploy ngnix-depl***
* ***kubectl edit deployment [deployment_name]***
* ***kubectl edit deployment nginx-depl***
####Replica Set
Replica set is managing the replicas of a pod
* ***kubectl get replicaset***

####Debugging
* ***kubectl logs [pod_name]***

#####Special Note: All images are taken from the youtube channel ***TechWorld with Nana***(https://tinyurl.com/yxpn5v88) 
***Video Url: https://tinyurl.com/y5bgcn7q***