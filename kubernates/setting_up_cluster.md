### download gpg key for docker and k8s
`curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`  

### add the docker repository
`cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list`  
`deb https://apt.kubernetes.io/ kubernetes-xenial main`
`EOF`

### update package listings
`sudo apt-get update`

### install
use install.sh 