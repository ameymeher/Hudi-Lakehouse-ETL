# Ingestion from CSV Source]

## Description

This project contains code for ingesting CSV files from a source to an Apache Hudi table.

## Process Diagram

<div align="center">
  <img src="../images/csv_to_hudi.png" alt="csv_to_hudi" width="60%" height="60%" style="margin-right: 10px;"/>
</div>

## Steps to execute

1. Run `python datagen.py` being in the source folder to generate a sample dataset
2. Use the jar file as directed in the main project readme file
3. Install all the packages and tech as suggested in the main project readme file
4. Update the target path in the job.ksh as per your project location
5. Run the command: `ksh job.ksh`

## Use cases

1. Initial Data Ingestion: Bulk loading raw CSV data into Hudi tables for the first time.
2. Data Transformation and ETL: Converting raw CSV data into a structured, queryable format.
3. Analytics and Reporting: Enabling faster queries on large CSV datasets for reporting and analysis.
4. Compliance and Data Retention: Retaining historical data for compliance purposes while maintaining an active dataset.