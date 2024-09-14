spark-submit \
  --class org.apache.hudi.utilities.HoodieClusteringJob \
  --packages org.apache.hudi:hudi-spark3.4-bundle_2.12:0.15.0 \
  --properties-file ../spark-config.properties \
  --master 'local[*]' \
  --executor-memory 3g \
   ../jar/hudi-utilities-slim-bundle_2.12-0.15.0.jar \
  --mode scheduleAndExecute \
  --base-path file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Async\ clustering\ -\ Removing\ small\ file\ issue/target/orders  \
  --table-name orders \
  --hoodie-conf hoodie.clustering.async.enabled=true \
  --hoodie-conf hoodie.clustering.async.max.commits=2 \
  --hoodie-conf hoodie.clustering.plan.strategy.target.file.max.bytes=1073741824 \
  --hoodie-conf hoodie.clustering.plan.strategy.small.file.limit=4438390 \
  --hoodie-conf hoodie.clustering.execution.strategy.class=org.apache.hudi.client.clustering.run.strategy.SparkSortAndSizeExecutionStrategy \
  --hoodie-conf hoodie.clustering.plan.strategy.sort.columns=order_date \
  --hoodie-conf 'hoodie.clustering.plan.strategy.partition.regex.pattern=^2024-08-[0-9][0-9]$' \
  --hoodie-conf hoodie.write.concurrency.mode=optimistic_concurrency_control \
  --hoodie-conf hoodie.write.lock.provider=org.apache.hudi.client.transaction.lock.InProcessLockProvider