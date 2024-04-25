/// 
Class MyApp.Service.TriggerSNS Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

/// See <a href="https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_busservice#EGDV_busservice_onprocessinput">the documentation</a>
/// for tips on how to implement this method.
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
  // aws sns publish --topic-arn arn:aws:sns:ap-northeast-1:[AWSアカウントID]:my_topic --subject "Test Messages" --message "Hello World"
  Set pRequest=##class(EnsLib.AmazonSNS.PublishRequest).%New()
  Set pRequest.Message="Hello world"
  Set tSC=..SendRequestSync("EnsLib.AmazonSNS.BusinessOperation", pRequest, .pResponse)

  Return tSC
}

}
