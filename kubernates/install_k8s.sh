#! /bin/bash

# load overlay and br_netfilter kernel modules on startup
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay  
br_netfilter  
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# some settings that we need for k8s networking to work as expecting
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf  
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1  
net.bridge.bridge-nf-call-ip6tables = 1  
EOF

sudo sysctl --system

# Install and configure containerd
sudo apt-get update
yes | sudo apt-get install -y containerd 
sudo mkdir -p /etc/containerd  
sudo containerd config default | sudo tee /etc/containerd/config.toml  
sudo systemctl restart containerd

# disable swap
sudo swapoff -a   
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Install some dependencies
sudo apt-get update
yes | sudo apt-get install -y apt-transport-https curl

# Add GPG key to the system
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add k8s repositories to the repositories list
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list  
deb https://apt.kubernetes.io/ kubernetes-xenial main  
EOF

# install k8s
sudo apt-get update
yes | sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

