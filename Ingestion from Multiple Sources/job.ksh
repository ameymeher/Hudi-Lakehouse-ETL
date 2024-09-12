spark-submit \
  --class org.apache.hudi.utilities.deltastreamer.HoodieMultiTableDeltaStreamer \
  --packages org.apache.hudi:hudi-spark3.4-bundle_2.12:0.14.0 \
  --properties-file ../spark-config.properties \
  --master 'local[*]' \
  --executor-memory 1g \
   ../jar/hudi-utilities-slim-bundle_2.12-0.14.0.jar \
  --op UPSERT \
  --table-type COPY_ON_WRITE \
  --source-ordering-field ts \
  --source-class org.apache.hudi.utilities.sources.CsvDFSSource \
  --base-path-prefix file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Ingestion\ from\ Multiple\ Sources/target/ \
  --target-table customers,orders \
  --config-folder file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Ingestion\ from\ Multiple\ Sources/config-folder/  \
  --props file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Ingestion\ from\ Multiple\ Sources/config-folder/source.properties