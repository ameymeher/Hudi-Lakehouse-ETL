Need for this:
1. Load data from any of the source to Hudi in a fast manner.
2. Due to this requirement, the data can be raw, have duplicates or some issues. This is called as bronze layer.
3. For creating a good dataset, or a silver layer, you need to read from this Hudi source, perform the necessary tasks and load into the silver source.
4. Good dataset meaning, creating and maintaining indexes, doing some transformations, selecting appropriate columns, doing some partitioning


# Hudi Operations Table

| Operation               | Description                                                                                     | Use Case                                             |
|-------------------------|-------------------------------------------------------------------------------------------------|------------------------------------------------------|
| `insert`                | Inserts new records without checking for existing records.                                       | New data ingestion where no updates are needed.      |
| `upsert`                | Inserts new records and updates existing ones based on the primary key.                         | Streaming data with potential updates to existing records. |
| `bulk_insert`           | Bulk loading of data for initial bootstrapping or fast ingestion.                                | Initial data loading or large one-time imports.      |
| `delete`                | Deletes records based on the primary key.                                                       | Removing data, such as for GDPR or cleanup.          |
| `insert_overwrite`      | Replaces the contents of a specific partition with new records.                                  | Overwriting partitions with corrected data.          |
| `insert_overwrite_table`| Replaces the entire table with new data.                                                         | Full dataset refresh.                                |
| `delete_partition`      | Deletes all records in a specific partition.                                                    | Removing irrelevant or outdated partitions.          |