Set ws = CreateObject("Wscript.Shell") 

batpath=left(wscript.scriptfullname,instrrev(wscript.scriptfullname,"\")-1) 
batpath = batpath & "\middlePlugin.bat"

rem Wscript.echo batpath

ws.run "cmd /c " & batpath,vbhide 