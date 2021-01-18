Create 3 servers with Ubuntu 16.04, size medium   
1. Kube Master  
2. Kube Worker 1  
3. Kube Worker 2  

At master get join command   
```kubeadm token create --print-join-command``` -> will print a command like bellow, use sudo and run in worker to join.   

```sudo kubeadm join 172.31.8.131:6443 --token xd30m0.adpgsj7ahcym2tyb     --discovery-token-ca-cert-hash sha256:733bdd4e0a900a9404c2b1506b7da4cfbdaec941736a5683406eb782061a547a ```

Then in master run  
```kubectl get po -A```
