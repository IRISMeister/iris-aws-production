/// 
Class MyApp.Operation.ReceiveSQSMessage Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method Exec(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
  Set tSC=$$$OK
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
