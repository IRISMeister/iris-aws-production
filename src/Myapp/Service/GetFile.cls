/// 
Class Myapp.Service.GetFile Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.CloudStorage.InboundAdapter";

/// See <a href="https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_busservice#EGDV_busservice_onprocessinput">the documentation</a>
/// for tips on how to implement this method.
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
  Return $$$ERROR($$$NotImplemented)
}

}
