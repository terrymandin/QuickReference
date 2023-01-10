# ADX Quick Reference

## Show ingestion failures
.show ingestion failures

## Route ingest to blob storage
.dup-next-ingest into IoTTable to "<Shared Access Token with http>"

## Reduce batch time
```
.alter table <table name> policy ingestionbatching
<THREE SINGLE QUOTES>
{    
  "MaximumBatchingTimeSpan" : "00:00:10",    
  "MaximumNumberOfItems" : 100,    
  "MaximumRawDataSizeMB": 200
}
<THREE SINGLE QUOTES>
```
