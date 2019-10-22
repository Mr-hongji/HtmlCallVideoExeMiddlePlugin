Set ws = CreateObject("Wscript.Shell") 

batpath=left(wscript.scriptfullname,instrrev(wscript.scriptfullname,"\")-1) 
batpath2 = batpath & "\middlePlugin.bat"
batpath1 = batpath & "\killwebex.bat"

rem batpath = "middlePlugin.bat"

rem Wscript.echo batpath

rem 结束wrf视频播放器
ws.run "cmd /c " & batpath1,vbhide
rem 设置一个睡眠时间间隔，防止时间差导致，会杀掉刚运行的wrf视频播放器进程
wscript.sleep 500 
ws.run "cmd /c " & batpath2,vbhide 