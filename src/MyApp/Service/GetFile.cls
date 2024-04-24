/// 
Class MyApp.Service.GetFile Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.CloudStorage.InboundAdapter";

/// See <a href="https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_busservice#EGDV_busservice_onprocessinput">the documentation</a>
/// for tips on how to implement this method.
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
  Set tSC=$$$OK
  $$$TRACE("Name:"_pInput.Name)  
  $$$TRACE("Meta:"_pInput.Meta)  
  $$$TRACE("Size in bytes:"_pInput.Content.Size)
  Return tSC
}

}
