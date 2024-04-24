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
  <Item Name="MyApp.Service.CloudWatch" Category="" ClassName="MyApp.Service.CloudWatch" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">60</Setting>
  </Item>
  <Item Name="MyApp.Service.GetFile" Category="" ClassName="MyApp.Service.GetFile" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="BlobNamePattern">test*.csv</Setting>
    <Setting Target="Adapter" Name="BucketName">mybucket</Setting>
    <Setting Target="Adapter" Name="StorageRegion">ap-northeast-1</Setting>
    <Setting Target="Adapter" Name="BlobNamePrefix">inbound</Setting>
  </Item>
  <Item Name="MyApp.Operation.PutFile" Category="" ClassName="MyApp.Operation.PutFile" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="StorageRegion">ap-northeast-1</Setting>
  </Item>
</Production>
}

}
