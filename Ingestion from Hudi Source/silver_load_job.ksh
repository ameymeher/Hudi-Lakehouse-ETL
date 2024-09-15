spark-submit \
    --class org.apache.hudi.utilities.streamer.HoodieStreamer \
    --packages 'org.apache.hudi:hudi-spark3.4-bundle_2.12:0.14.0' \
    --properties-file   spark-config.properties \
    --master 'local[*]' \
    --executor-memory 1g \
     ../jar/hudi-utilities-slim-bundle_2.12-0.14.0.jar  \
    --table-type COPY_ON_WRITE \
    --op UPSERT \
    --source-ordering-field ts \
    --source-class org.apache.hudi.utilities.sources.HoodieIncrSource \
    --target-base-path file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Ingestion\ from\ Hudi\ Source/target/silver_orders \
    --target-table silver_orders \
    --hoodie-conf hoodie.streamer.source.hoodieincr.path=file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Ingestion\ from\ Hudi\ Source/target/bronze_orders \
    --hoodie-conf 'hoodie.streamer.source.hoodieincr.missing.checkpoint.strategy=READ_UPTO_LATEST_COMMIT'