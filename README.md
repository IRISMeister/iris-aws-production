# How to use CloudWatch operation and S3 in/out bound adapters.

Edit [.env](.env) to satisfy [Default credentials provider chain](https://docs.aws.amazon.com/ja_jp/sdk-for-java/latest/developer-guide/credentials-chain.html).

```
docker compose up -d
```

Go to [production sceen](http://localhost:8080/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=MyApp.Production&$NAMESPACE=USER)

## CloudWatch

Same as
```
aws cloudwatch put-metric-data --namespace MyNameSpace --metric-name TestMetric --dimensions TestKey=TestValue --value 250 --unit None
```

https://docs.aws.amazon.com/cli/latest/reference/cloudwatch/put-metric-data.html

## S3 

InBound
See [GetFile.cls](src/MyApp/Service/GetFile.cls)

Same as
```
aws s3 cp s3://mybucket/inbound/test1.csv .
```

OutBound

See [PutFile.cls](src/MyApp/Operation/PutFile.cls)

Same as
```
aws s3 cp ./test1.csv s3://mybucket/outbound/test1.csv
```
