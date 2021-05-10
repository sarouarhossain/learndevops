* clone the project 
```
git clone https://github.com/linuxacademy/robot-shop.git
```

* create a namespace
```
kubectl create namespace robot-shop
```

* deploy all descriptors 
```
kubectl -n robot-stor create -f ./descriptors_locations
```

* increase the replicas of mongodb
```
kubectl edit deployment mongodb -n robot-shop
```