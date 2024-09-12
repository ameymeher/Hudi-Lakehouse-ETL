import os
import sys
from pyspark.sql import SparkSession

HUDI_VERSION = '0.15.0'
SPARK_VERSION = '3.4'

SUBMIT_ARGS = (
    f"--packages org.apache.hudi:hudi-spark{SPARK_VERSION}-bundle_2.12:{HUDI_VERSION} pyspark-shell"
)
os.environ["PYSPARK_SUBMIT_ARGS"] = SUBMIT_ARGS
os.environ['PYSPARK_PYTHON'] = sys.executable

# Configure Spark session
spark = (
    SparkSession.builder
    .config('spark.serializer', 'org.apache.spark.serializer.KryoSerializer')
    .config('spark.sql.catalog.spark_catalog', 'org.apache.spark.sql.hudi.catalog.HoodieCatalog')
    .config('spark.sql.extensions', 'org.apache.spark.sql.hudi.HoodieSparkSessionExtension')
    .config('spark.kryo.registrator', 'org.apache.spark.HoodieSparkKryoRegistrar')
    .config('className', 'org.apache.hudi')
    .config('spark.sql.hive.convertMetastoreParquet', 'false')
    .getOrCreate()
)

# =====================================================

path = "file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Continuous mode and transformer/target/orders/"
check_point_path = "file:///Users/amey/Desktop/repos/Real-time-Lakehouse-Analytics/Continuous mode and transformer/target/checkpoints/"

# =====================================================

# read stream to streaming df
stream_df = (
    spark.readStream
    .format("hudi")
    .load(path)
)

def process_batch(df, batch_num):
    try:
        if df.count() >0:
            df.select(['order_id','priority']).show()
            print(f"Records added in batch {batch_num}: {df.count()}")
    except Exception as e:
        print("Error in processing batch:", batch_num)
        print(e)


query = (
    stream_df.writeStream
    .format("console")
    .option("checkpointLocation", check_point_path)
    .foreachBatch(process_batch)
    .start()
)

# wait for the stream to finish
query.awaitTermination()