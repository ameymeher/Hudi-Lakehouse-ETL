TODO:
1. Yet to handle tombstone events


Explanation for kafka image

The dougdonohoe/fast-data-dev image is a Docker container designed to provide a Kafka development environment. It's based on Landoop's Fast Data Dev image, which offers a pre-configured stack for quickly setting up Kafka and related services for development and testing purposes.

This image typically includes several tools and services related to the Kafka ecosystem:

Kafka Broker: For publishing and subscribing to messages.
Zookeeper: For managing Kafka brokers and metadata.
Schema Registry: To store and retrieve Avro schemas for Kafka messages.
Kafka REST Proxy: To interact with Kafka over REST APIs.
Kafka Connect: For connecting external systems like databases, file systems, etc., to Kafka.
Kafka Topics UI: For viewing and managing Kafka topics.


Postgresonnecter code:

name=PostgresConnector
connector.class=io.debezium.connector.postgresql.PostgresConnector
database.user=postgres
database.dbname=postgres
tasks.max=1
database.hostname=postgres
database.password=postgres
database.server.name=postgres
table.include.list=public.sales
database.port=5432
plugin.name=pgoutput
delete.enabled=true
transforms.unwrap.drop.tombstones=false
schema.evolution=basic