!include nsdialogs.nsh
XPStyle on
Var exedirStr
;自动创建log04文件
!include "MUI.nsh"
!include "WinCore.nsh"
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "WinMessages.nsh"

!include "WndSubclass.nsh"
!include "WordFunc.nsh"
!include "x64.nsh"
OutFile "E:\MyGitHubProject\HtmlCallVideoExeMiddlePlugin\MiddlePlugin\VideoPlayerRegister.exe"
Name "VideoPlayerRegister"
Section "test"

  ${WordReplace} "$EXEDIR" "\" "\\" "+" $R0


 	;MessageBox MB_ICONEXCLAMATION|MB_OK "$R0"

	ClearErrors
	FileOpen $0 c:\videoPlayer.reg w
	IfErrors done
	FileWrite $0 'Windows Registry Editor Version 5.00'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '[HKEY_CLASSES_ROOT\videoPlayer]'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '"URL Protocol"="$R0\\MiddlePlugin.exe"'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '@="videoPlayerProtocol"'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '[HKEY_CLASSES_ROOT\videoPlayer\DefaultIcon]'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '@="$R0\\MiddlePlugin.exe,1"'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '[HKEY_CLASSES_ROOT\videoPlayer\shell]'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '[HKEY_CLASSES_ROOT\videoPlayer\shell\open]'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '[HKEY_CLASSES_ROOT\videoPlayer\shell\open\command]'
	FileWrite $0 $\r$\n$\r$\n
	FileWrite $0 '@="\"$R0\\MiddlePlugin.exe\" \"%1\""'

	FileClose $0
	


	ClearErrors
	FileOpen $0 c:\videoPlayerTemp.bat w
	IfErrors done
	FileWrite $0 '@echo off'
	FileWrite $0 $\r$\n
	FileWrite $0 'regedit /s c:\videoPlayer.reg'
	FileWrite $0 $\r$\n
	FileWrite $0 'pause'

	FileClose $0
	done:


	ExecWait c:\videoPlayerTemp.bat
	Delete c:\videoPlayerTemp.bat


SectionEnd

