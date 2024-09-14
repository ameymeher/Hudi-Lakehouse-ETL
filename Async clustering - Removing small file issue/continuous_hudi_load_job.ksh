spark-submit \
    --class org.apache.hudi.utilities.streamer.HoodieStreamer \
    --packages org.apache.hudi:hudi-spark3.4-bundle_2.12:0.15.0 \
    --properties-file ../spark-config.properties \
    --master 'local[*]' \
    --executor-memory 1g \
    ../jar/hudi-utilities-slim-bundle_2.12-0.15.0.jar \
    --continuous \
    --source-limit 4000000 \
    --min-sync-interval-seconds 20 \
    --table-type COPY_ON_WRITE \
    --op UPSERT \
    --source-ordering-field ts \
    --source-class org.apache.hudi.utilities.sources.CsvDFSSource \
    --target-base-path file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Async\ clustering\ -\ Removing\ small\ file\ issue/target/orders \
    --target-table orders \
    --props hudi_tbl.props