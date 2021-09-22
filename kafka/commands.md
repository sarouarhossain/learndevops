# Topic
------
```
kafka-topics --bootstrap-server localhost:9092 --topic topic_name --create --partitions partition_number --replication-factor rf_number
kafka-topics --zookeeper localhost:2181 --topic topic_name --create --partitions partition_number --replication-factor rf_number 
```
```
kafka-topics.sh --bootstrap-server localhost:9092 --list
kafka-topics.sh --zookeeper localhost:2181 --list
```
```
kafka-topics.sh --zookeeper localhost:2181 --describe
```
```
kafka-topics.sh --zookeeper localhost:2181 --topic topic_name --delete
```

# Producer
---------
```
kafka-console-producer.sh --broker-list localhost:9092 --topic topic_name
kafka-console-producer.sh --broker-list localhost:9092 --topic topic_name --producer-property acks=all
```


-> Special case when topic is not present
```
kafka-console-producer.sh --broker-list localhost:9092 --topic new_topic
```

##### Producer with keys
```
kafka-console-producer.sh --broker-list localhost:9092 --topic first_topic --property parse.key=true --property key.separator=,
```

# Consumer
---------
```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --from-beginning
```

##### Consumer Group
```
kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic first_topic --group group_name
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group app1 --describe
```

##### Reset Offsets
```
kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group app1 --reset-offsets --to-earliest --execute --topic first_topic
```

##### Consumer With Key
```
kafka-console-consumer --bootstrap-server localhost:9092 --topic first_topic --group app1 --from-beginning --property print.key=true --property key.separator=,
``` 