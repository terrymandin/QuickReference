# Azure Stream Analytics Queries

## Show Messages
```
SELECT NodeId, IoTHub.Value.Value, IoTHub.Value.SourceTimestamp
FROM IoTHub timestamp by IoTHub.Value.SourceTimestamp
```

## Messages / Second
```
SELECT System.TimeStamp() as TimeStamp, count(*) as MessagesPerSecond
FROM IoTHub timestamp by IoTHub.Value.SourceTimestamp
GROUP BY TumblingWindow(second,1)
```
