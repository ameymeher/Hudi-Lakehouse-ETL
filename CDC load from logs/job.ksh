spark-submit \
    --class org.apache.hudi.utilities.deltastreamer.HoodieDeltaStreamer \
    --packages org.apache.hudi:hudi-spark3.4-bundle_2.12:0.14.0 \
    --properties-file ../spark-config.properties \
    --master 'local[*]' \
    --executor-memory 1g \
    ../jar/hudi-utilities-slim-bundle_2.12-0.14.0.jar \
    --table-type COPY_ON_WRITE \
    --target-base-path file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/CDC\ load\ from\ logs/target/orders/ \
    --target-table orders \
    --source-ordering-field updated_at \
    --source-class org.apache.hudi.utilities.sources.debezium.PostgresDebeziumSource \
    --payload-class org.apache.hudi.common.model.debezium.PostgresDebeziumAvroPayload \
    --op UPSERT \
    --continuous \
    --source-limit 4000000 \
    --min-sync-interval-seconds 20 \
    --hoodie-conf bootstrap.servers=localhost:7092 \
    --hoodie-conf schema.registry.url=http://localhost:8081 \
    --hoodie-conf hoodie.deltastreamer.schemaprovider.registry.url=http://localhost:8081/subjects/postgres.public.sales-value/versions/latest \
    --hoodie-conf hoodie.deltastreamer.source.kafka.value.deserializer.class=io.confluent.kafka.serializers.KafkaAvroDeserializer \
    --hoodie-conf hoodie.deltastreamer.source.kafka.topic=postgres.public.sales \
    --hoodie-conf auto.offset.reset=earliest \
    --hoodie-conf hoodie.datasource.write.insert.drop.duplicates=true \
    --hoodie-conf hoodie.datasource.write.recordkey.field=salesid \
    --hoodie-conf hoodie.datasource.write.partitionpath.field=destinationstate \
    --hoodie-conf hoodie.datasource.write.keygenerator.class=org.apache.hudi.keygen.SimpleKeyGenerator \
    --hoodie-conf hoodie.datasource.write.hive_style_partitioning=true \
    --hoodie-conf hoodie.datasource.write.precombine.field=updated_at