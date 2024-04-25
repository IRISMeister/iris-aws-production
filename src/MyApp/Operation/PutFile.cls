/// 
Class MyApp.Operation.PutFile Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.CloudStorage.OutboundAdapter";

Property Adapter As EnsLib.CloudStorage.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method Exec(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
  Set BucketName="irismeister-bucket/outbound"
  Set filename="test1.csv"
  Set BlobName=filename
  Set localdir="/home/irisowner/"
  Set tSC = ..Adapter.UploadBlobFromFile(BucketName, BlobName,localdir_filename)  
  Return tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.Request">
    <Method>Exec</Method>
  </MapItem>
</MapItems>
}

}
