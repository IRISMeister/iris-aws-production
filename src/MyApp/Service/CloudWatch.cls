/// 
Class MyApp.Service.CloudWatch Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

/// See <a href="https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EGDV_busservice#EGDV_busservice_onprocessinput">the documentation</a>
/// for tips on how to implement this method.
Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status
{
  // aws cloudwatch put-metric-data --namespace MyNameSpace --metric-name TestMetric --dimensions TestKey=TestValue --value 250 --unit None
  Set pRequest=##class(EnsLib.AmazonCloudWatch.PutMetricDataRequest).%New()
  Set pRequest.Namespace="MyNameSpace"
  Set pRequest.MetricName="TestMetric"
  Set pRequest.MetricValue=$R(100)+50
  Set pRequest.MetricUnit="None"
  Set dim=[{"Name":"TestKey","Value":"TestValue"}]
  Set pRequest.Dimensions=dim.%ToJSON()
  Set tSC=..SendRequestSync("EnsLib.AmazonCloudWatch.MetricDataOperation", pRequest, .pResponse)

  Return tSC
}

}
