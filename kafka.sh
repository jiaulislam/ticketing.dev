docker network create ticketing-network
docker network connect ticketing-network kafka-broker

docker run -d \
  --name kafka-broker \
  --network ticketing-network \
  -p 9092:9092 \
  -e KAFKA_NODE_ID=1 \
  -e KAFKA_PROCESS_ROLES=broker,controller \
  -e KAFKA_LISTENERS=PLAINTEXT://0.0.0.0:9092,CONTROLLER://localhost:9093 \
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 \
  -e KAFKA_CONTROLLER_LISTENER_NAMES=CONTROLLER \
  -e KAFKA_CONTROLLER_QUORUM_VOTERS=1@localhost:9093 \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  -e KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1 \
  -e KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1 \
  -e KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0 \
  -e KAFKA_NUM_PARTITIONS=1 \
  apache/kafka:latest

sleep 10

docker exec kafka-broker /opt/kafka/bin/kafka-topics.sh \
  --create --if-not-exists --bootstrap-server kafka-broker:9092 --topic ticket.created

docker exec kafka-broker /opt/kafka/bin/kafka-topics.sh \
  --create --if-not-exists --bootstrap-server kafka-broker:9092 --topic ticket.updated

docker exec kafka-broker /opt/kafka/bin/kafka-topics.sh \
  --create --if-not-exists --bootstrap-server kafka-broker:9092 --topic order.created

docker exec kafka-broker /opt/kafka/bin/kafka-topics.sh \
  --create --if-not-exists --bootstrap-server kafka-broker:9092 --topic order.updated
