#!/bin/sh

sudo apt update
sudo apt upgrade

sudo apt install docker.io
docker ––version

sudo systemctl enable docker
test
sudo systemctl start docker

#sudo systemctl status docker

# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

# sudo apt-add-repository "deb http://apt.kubernetes.io/kubernetes-xenial main"

sudo apt-get install kubeadm kubelet kubectl

sudo apt-mark hold kubeadm kubelet kubectl

kubeadm version

