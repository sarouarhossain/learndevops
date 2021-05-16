#! /bin/bash

#sudo su

# disable SELinux
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux


# load overlay and br_netfilter kernel modules on startup
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

# some settings that we need for k8s networking to work as expecting
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf  
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1  
net.bridge.bridge-nf-call-ip6tables = 1  
EOF

sysctl --system

# Install and configure containerd
yum install -y yum-utils
# yum-config-manager \
# --add-repo \
# https://download.docker.com/linux/centos/docker-ce.repo
yum update -y
yes | yum install -y containerd
mkdir -p /etc/containerd  
containerd config default | sudo tee /etc/containerd/config.toml  
systemctl restart containerd

# disable swap
swapoff -a   
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Install some dependencies
yum update -y
yes | yum install -y curl

# Add k8s repositories to the repositories list
cat << EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
  https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF


# install k8s
yum update -y
yes | yum install -y kubelet kubeadm kubectl
systemctl enable kubelet

