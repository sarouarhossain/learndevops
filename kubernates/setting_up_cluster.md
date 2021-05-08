## In All Nodes
* Enable some kernel modules. `containerd.conf` is going to instruct the OS to load `overlay` and `br_netfilter` kernel modules on startup. Those kernel module we are gonna need for container runtime containerd. 
`cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf`
`overlay`  
`br_netfilter`  
`EOF`    
`sudo modprobe overlay`  -> load the upper modules immediately.
`sudo modprobe br_netfilter`  -> same

* Set some settings in the OS. These settings are set when server starts up. These are some settings that we need for k8s networking to work as expecting. 
`cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf`  
`net.bridge.bridge-nf-call-iptables  = 1`  
`net.ipv4.ip_forward                 = 1`  
`net.bridge.bridge-nf-call-ip6tables = 1`  
`EOF`  
`sudo sysctl --system` -> apply those settings immediately. 

* Install and configure containerd
`sudo apt-get update && sudo apt-get install -y containerd`  
`sudo mkdir -p /etc/containerd`  
`sudo containerd config default | sudo tee /etc/containerd/config.toml`  
`sudo systemctl restart containerd`  

* On all nodes, disable swap.
`sudo swapoff -a`  
`sudo sed -i'/ swap / s/^\(.*\)$/#\1/g' /etc/fstab`     

* Install some dependencies
`sudo apt-get update && sudo apt-get install -y apt-transport-https curl`  

* Add GPG key to my system
`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`

* Add k8s repositories to my repositories list
`cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list`  
`deb https://apt.kubernetes.io/ kubernetes-xenial main`  
`EOF`  

* To pull down the new package definitions
`sudo apt-get update`  

* Install k8s
`sudo apt-get install -y kubelet=1.20.1-00 kubeadm=1.20.1-00 kubectl=1.20.1-00`  

To prevent unattended automatic upgrades-
`sudo apt-mark hold kubelet kubeadm kubectl`  

#### Only on Master
`sudo kubeadm init --pod-network-cidr 192.168.0.0/16`  
`mkdir -p $HOME/.kube`  
`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`
`sudo chown $(id -u):$(id -g) $HOME/.kube/config`  

Verify version  
`kubectl version`  

Install Network  
`kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml`  

Check Calico related pods  
`kubectl get pods -n kube-system`  

Get the join command 
`kubeadm tokencreate --print-join-command`  

In Node to join  
`sudo kubeadm join ..`