Class MyApps.Installer
{

ClassMethod setup(ByRef tVars) As %Status
{
  Set tSC='$$$OK
  Try {

    Set oldns=$NAMESPACE
    New $NAMESPACE
    Set $NAMESPACE="%SYS"

    Set $NAMESPACE="USER"
    Do ##class(%Library.EnsembleMgr).EnableNamespace("USER")
    Do $System.OBJ.ImportDir("/home/irisowner/src/MyApp","*.xml;*.cls;*.mac;*.int;*.inc;*.dfi","ck",,1)
    Set sc=##class(Ens.Director).SetAutoStart("MyApp.Production")

    Set $NAMESPACE=oldns
    Set tSC=$$$OK

  } Catch(e) {
	  Set tSC=e.AsStatus()
    zw tSC
  }
  Return tSC
}

}
