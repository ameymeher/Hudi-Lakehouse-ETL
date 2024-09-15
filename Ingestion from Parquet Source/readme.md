# Parquet to Apache Hudi Ingestion

## Description

This project contains code for ingesting Parquet files from a source to an Apache Hudi table.

## Process Diagram

<div align="center">
  <img src="../images/parquet_to_hudi.png" alt="parquet_to_hudi" width="60%" height="60%" style="margin-right: 10px;"/>
</div>

## Steps to execute

1. Keep some sample parquet files in a folder called 'source' in this directory
2. Use the jar file as directed in the main project readme file
3. Install all the packages and tech as suggested in the main project readme file
4. Update the target path in the job.ksh as per your project location
5. Run the command: `ksh job.ksh`

## Use case

1. **Incremental Data Ingestion**: Loading only the new or changed records from Parquet files into Hudi tables.
2. **Batch and Real-time Data Consolidation**: Merging data from batch Parquet files with real-time data streams.
3. **Time Travel and Data Auditing**: Maintaining historical versions of data for auditing and debugging purposes.
4. **Efficient Querying with Partitioning**: Optimizing data queries through partitioning.
5. **Data Lakehouse Architecture**: Implementing a lakehouse architecture for unified analytics.


