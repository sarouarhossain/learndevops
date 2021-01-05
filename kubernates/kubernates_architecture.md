#####Special Note: All images are taken from the youtube channel ***TechWorld with Nana***(https://tinyurl.com/yxpn5v88) 
***Video Url: https://tinyurl.com/y5bgcn7q***

###Nodes
1. each node has multiple pods on it
2. 3 processes must be installed in each nodes
   * container runtime (docker or anything)
   * Kubelet - kubelet interects with both the container and node. kubelet starts the pod with a container inside
   * kube proxy - forwards request. it has intellegent forwording logic.  
3. worker nodes do the actual task
4. master nodes do the managment of workers
   * schedule pod
   * monitor
   * re-schedule/re-start pod
   * join a new node etc  
5. 4 processes run on every master node
   * Api server - cluster gateway. also acts as a gatekeeper for authentication.
   * Scheduler - Schedule new pod. It has intellegent logics inside to understand where to put the new pod. 
   * Controller manager - detects cluster state chnages
   * etcd - key value store of the cluster state. cluster changes get stored in the key value store

####Worker Node
-----------------
![nodes](https://user-images.githubusercontent.com/26240597/103597679-2b6f0a80-4f44-11eb-9e25-df57f7247b70.png)

####Master Node
----------------
####Api Server
![apiserver](https://user-images.githubusercontent.com/26240597/103627124-83c3fd80-4f80-11eb-833e-8d307d8f21c3.png)

####Scheduler
![scheduler](https://user-images.githubusercontent.com/26240597/103598235-74738e80-4f45-11eb-8866-3e3abeb18685.png)

####Controller manager
![controllmanager](https://user-images.githubusercontent.com/26240597/103598521-29a64680-4f46-11eb-9beb-d4c6d824e0eb.png)

####etcd
![etcd](https://user-images.githubusercontent.com/26240597/103598527-2b700a00-4f46-11eb-94e3-ea3e2f2a6036.png)


#####Special Note: All images are taken from the youtube channel ***TechWorld with Nana***(https://tinyurl.com/yxpn5v88) 
***Video Url: https://tinyurl.com/y5bgcn7q***
