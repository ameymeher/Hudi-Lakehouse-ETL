# ETL processes for managing Apache Hudi Lakehouse

## Overview

This repository contains various data ingestion and processing workflows designed to handle diverse data sources to manage a Apache Hudi lakehouse architecture.<br> 
The processes include data ingestion from multiple processes,CDC (Change Data Capture), and clustering for solving problems related to small files.

## Processes

### 1. Ingestion from Parquet Source
- **Description:** Ingesting parquet files from a source to an Apache Hudi table.

<div align="center">
  <img src="images/parquet_to_hudi.png" alt="parquet_to_hudi" width="60%" height="60%" style="margin-right: 10px;"/>
</div>

### 2. Ingestion from CSV Source
- **Description:** Ingesting CSV files from a source to an Apache Hudi table.

### 3. Incremental Pull from Postgres
- **Description:** Fetching latest data inserted/updated in a Postgres table into an Apache Hudi table.

### 4. Ingestion from Kafka Source
- **Description:** Fetching data from a Kafka topic to an Apache Hudi table.

### 5. Ingestion from Kafka Source using SchemaRegistry
- **Description:** Fetching data from a Kafka topic to an Apache Hudi table, also managing the schema for the Kafka topic in a registry making the process more manageable.

### 6. Ingestion from Multiple Homogeneous Sources
- **Description:** Apache Hudi job to ingest data from multiple homogeneous sources at a time, in this case, reading multiple CSV files.

### 7. Apache Hudi Continuous Mode Ingestion and using Transformer while loading
- **Description:** Apache Hudi job scanning for changes in the source periodically and ingesting data from the source as well as applying light transformation while loading using transformer.

### 8. Ingestion from Hudi Source
- **Description:** Creating a silver data layer from a bronze data layer of Hudi tables.

### 9. Load to MinIO
- **Description:** Managing the datalake on a MinIo platform, making it similar to loading the data on AWS S3.

### 10. CDC Load from Logs
- **Description:** Change data capture pipeline, utilizing Debezium and Kafka connector to fetch the updated data from a Postgres instance and update on the Apache Hudi lakehouse.

### 11. Async Clustering - Removing Small File Issue
- **Description:** Asynchronous Apache Hudi job to address the small file issue, improving read efficiency for Hudi tables.

### 12. Generic Multi-Table Postgres Ingestion
- **Description:** Generic code for loading multiple postgres tables in incremental mode to Apache Hudi.