Class MyApp.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="MyApp.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.AmazonCloudWatch.MetricDataOperation" Category="" ClassName="EnsLib.AmazonCloudWatch.MetricDataOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Region">ap-northeast-1</Setting>
  </Item>
  <Item Name="MyApp.Service.TriggerCloudWatch" Category="" ClassName="MyApp.Service.TriggerCloudWatch" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">60</Setting>
  </Item>
  <Item Name="MyApp.Service.GetFile" Category="" ClassName="MyApp.Service.GetFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="BlobNamePattern">*.csv</Setting>
    <Setting Target="Adapter" Name="BucketName">irismeister-bucket</Setting>
    <Setting Target="Adapter" Name="StorageRegion">ap-northeast-1</Setting>
    <Setting Target="Adapter" Name="BlobNamePrefix">inbound</Setting>
  </Item>
  <Item Name="MyApp.Service.TriggerSNS" Category="" ClassName="MyApp.Service.TriggerSNS" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">60</Setting>
  </Item>
  <Item Name="MyApp.Operation.PutFile" Category="" ClassName="MyApp.Operation.PutFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="StorageRegion">ap-northeast-1</Setting>
  </Item>
  <Item Name="EnsLib.AmazonSNS.BusinessOperation" Category="" ClassName="EnsLib.AmazonSNS.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Region">ap-northeast-1</Setting>
    <Setting Target="Host" Name="ARNTopic">arn:aws:sns:ap-northeast-1:xxxxxxx:my_topic</Setting>
    <Setting Target="Host" Name="Subject">Test Messages</Setting>
  </Item>
  <Item Name="EnsLib.AmazonSQS.Operation" Category="" ClassName="EnsLib.AmazonSQS.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Region">ap-northeast-1</Setting>
  </Item>
  <Item Name="EnsLib.AmazonSQS.Service" Category="" ClassName="EnsLib.AmazonSQS.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Region">ap-northeast-1</Setting>
    <Setting Target="Host" Name="TargetConfigNames">MyApp.Operation.ReceiveSQSMessage</Setting>
    <Setting Target="Adapter" Name="Queue">my_queue</Setting>
  </Item>
  <Item Name="MyApp.Operation.ReceiveSQSMessage" Category="" ClassName="MyApp.Operation.ReceiveSQSMessage" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="MyApp.Service.TriggerSQS" Category="" ClassName="MyApp.Service.TriggerSQS" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">60</Setting>
  </Item>
</Production>
}

}
