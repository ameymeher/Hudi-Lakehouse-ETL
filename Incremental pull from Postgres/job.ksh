spark-submit \
  --class org.apache.hudi.utilities.streamer.HoodieStreamer \
  --packages org.apache.hudi:hudi-spark3.4-bundle_2.12:0.15.0,org.postgresql:postgresql:42.5.4 \
  --properties-file ../spark-config.properties \
  --master 'local[*]' \
  --executor-memory 1g \
   ../jar/hudi-utilities-slim-bundle_2.12-0.15.0.jar \
  --table-type COPY_ON_WRITE \
  --op UPSERT \
  --source-ordering-field updated_at \
  --source-class org.apache.hudi.utilities.sources.JdbcSource \
  --target-base-path file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Incremental\ pull\ from\ Postgres/target/ \
  --target-table sales \
  --props hudi_tbl.props