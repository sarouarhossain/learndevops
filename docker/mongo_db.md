## Mongodb docker-compose
***Create a docker compose file***

```
version: '3'
services:
  database:
    image: 'mongo'
    container_name: 'mongodb'
    environment:
      - MONGO_INITDB_DATABASE=testdb
      - MONGO_INITDB_ROOT_USERNAME=rootusename
      - MONGO_INITDB_ROOT_PASSWORD=rootpassword
    volumes:
      - ./init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js
      - ./mongo-volume:/data/db
    ports:
      - '27017-27019:27017-27019'
```

***Now we need init-mongo.js in the directory where docker-compose file resides.***
```
db.createUser(
    {
        user: "admin",
        pwd: "admin",
        roles:[
            {
                role: "readWrite",
                db: "testdb"
            }
        ]
    }
)
```

#### Commands 
* ```docker-compose up -d``` to create container.
* ```docker ps``` to see the container lists
* ```docker exec -it <container-id> bash``` to login to container
* ```mongo -u <your username> -p <your password> --authenticationDatabase <your database name>``` to login mongo server
  
Mongo URL ```mongodb://YourUsername:YourPasswordHere@127.0.0.1:27017/your-database-name```