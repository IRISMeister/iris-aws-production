/// 
Class MyApp.Service.TriggerSQS Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

/// See <a href="https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_busservice#EGDV_busservice_onprocessinput">the documentation</a>
/// for tips on how to implement this method.
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
  // aws sqs send-message --queue-url "my_queue" --message-body "Welcome!"
  Set pRequest=##class(EnsLib.AmazonSQS.Message).%New()
  Set pRequest.queue="my_queue"
  Set pRequest.body="Welcome!"
  Set tSC=..SendRequestSync("EnsLib.AmazonSQS.Operation", pRequest, .pResponse)

  Return tSC
}

}
