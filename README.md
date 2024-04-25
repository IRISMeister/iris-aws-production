# How to use CloudWatch operation and S3 in/out bound adapters.

[Default credentials provider chain](https://docs.aws.amazon.com/ja_jp/sdk-for-java/latest/developer-guide/credentials-chain.html)の環境変数渡しを使用するために、[.env](.env)を書き換える。

[MyApp.Production.cls](src/MyApp/Production.cls)のxxxxxxx部をtopic作成時に得られる値(AWSのアカウントID)に書き換える。

```
<Setting Target="Host" Name="ARNTopic">arn:aws:sns:ap-northeast-1:xxxxxxx:my_topic</Setting>
```

## 起動
```
docker compose up -d
```

Go to [production sceen](http://localhost:8080/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=MyApp.Production&$NAMESPACE=USER)

## CloudWatch

アウトバウンドの動作確認。

本オペレーションは下記のコマンドと同等。
```
aws cloudwatch put-metric-data --namespace MyNameSpace --metric-name TestMetric --dimensions TestKey=TestValue --value 250 --unit None
```

https://docs.aws.amazon.com/cli/latest/reference/cloudwatch/put-metric-data.html

## S3 

インバウンドの動作確認。

See [GetFile.cls](src/MyApp/Service/GetFile.cls)

本サービスは下記のコマンドと同等。
```
aws s3 cp s3://irismeister-bucket/inbound/test1.csv .
```

アウトバウンドの動作確認。

See [PutFile.cls](src/MyApp/Operation/PutFile.cls)

本オペレーションは下記のコマンドと同等。
```
aws s3 cp ./test1.csv s3://irismeister-bucket/outbound/test1.csv
```

## SNS

事前準備
```
aws sns create-topic --name my_topic
aws sns list-topics 
SNS_TOPIC_ARN=$(aws sns list-topics | jq -r .Topics[0].TopicArn)
aws sns subscribe --topic-arn ${SNS_TOPIC_ARN} --protocol email --notification-endpoint あなたのメアド

確認メールを受信し、サブスクライブしたことをconfirmする。
```

アウトバウンドの動作確認。

本オペレーションは下記のコマンドと同等。
```
aws sns publish --topic-arn arn:aws:sns:ap-northeast-1:[AWSアカウントID]:my_topic --subject "Test Messages" --message "Hello World"
```

オペレーション起動すると、次のようなメールを受信する。

```
From: AWS Notifications <no-reply@sns.amazonaws.com> 
Sent: Thursday, xxx yy, 2024 2:37 PM
To: あなたのメアド
Subject: Test Messages

Hello World
```

## SQS

事前準備
```
aws sqs create-queue --queue-name my_queue
aws sqs list-queues
SQS_QUEUE_URL=$(aws sqs list-queues | jq -r .QueueUrls[0])
```

インバウンドの動作確認。

```
aws sqs send-message --queue-url "${SQS_QUEUE_URL}" --message-body "Hello world"
```
このコマンド実行により、EnsLib.AmazonSQS.Serviceが稼働する。ターゲット構成名となっているMyApp.Operation.ReceiveSQSMessageにメッセージが送られる。


アウトバウンドの動作確認。

MyApp.Service.TriggerSQSを有効化すると、my_queueにメッセージが投函される。そのメッセージは上記のインバウンド動作(EnsLib.AmazonSQS.Service)をトリガする。

> メッセージの送受信の無限ループにはなっていません
