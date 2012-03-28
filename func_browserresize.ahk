~+RButton up::


If EnableBrowserResize = 1
{
	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2
;msgbox % "1: "Mon1Left ":" Mon1Right ":" Mon1Top ":" Mon1Bottom "2: " Mon2Left ":" Mon2Right ":" Mon2Top ":" Mon2Bottom
	;WinClose, ahk_class #32768
	CoordMode, Mouse, Screen
	MouseGetPos, ClickX, ClickY, WindowUnderMouseID
	
	CoordMode, Mouse, Relative
	MouseGetPos, WinX,WinY,WindowUnderMouseID

	WinGetClass, ActClass1, ahk_id %WindowUnderMouseID%

	If ActClass1 contains BaseBar ;OR  ActClass1 contains gdkWindow
	{
		return
	}

	;WinActivate, ahk_id %WindowUnderMouseID%
	sysget, MonPrimary,MonitorPrimary
	sysget, Monitor1, Monitor, 1
	sysget, Monitor2, Monitor, 2
	sysget, SM_CYCAPTION, 4
	sysget, SM_CYFULLSCREEN, 17
	sysget, SM_CXMAXIMIZED, 61
	sysget, SM_CYMAXIMIZED, 62
	WinGetPos,TbX,TbY, TbW, TbH, ahk_class Shell_TrayWnd
	WinGetPos,ActX,ActY, ActW, ActH, ahk_id %WindowUnderMouseID%
	WinGet, MaxState%WindowUnderMouseID%, MinMax, ahk_id %WindowUnderMouseID%
	WinGetTitle, ablakcime, ahk_id %WindowUnderMouseID%
	
		If ablakcime not contains Notepad++, Firefox, Internet Explorer, Chrome, Opera, Maxthon, Safari, 
	{
		return
	}
	
	XOffset=0
	setformat, float, 0.0
	Offset:=(SM_CXMAXIMIZED-(Mon1Right-Mon1Left))/2
	
	If (MaxState%WindowUnderMouseID% = 1 and  ActX=Mon1Left-Offset)
	{
	XOffset := Offset
	}
	If (MaxState%WindowUnderMouseID% = 1 and  ActX=Mon2Left-Offset)
	{
	XOffset := Offset
	}	
	
	
	;msgbox %TbY% %Mon1Bottom% %Monitor1Bottom% ;%TbH%  %SM_CXMAXIMIZED% %Mon1Top% %Mon1Bottom% %SM_CYCAPTION%  %SM_CYFULLSCREEN% %XOffset%


	If (ClickX >= Mon1Left-XOffset and ClickX < Mon1Right-XOffset) ;primary monitor
	{
		If (TbY=0 and WinX < 22 and WinY <22 and ClickY>Mon1Top)  ;Taskbar fent es latszik
		{
			Menu, browserresize, add
			Menu, browserresize, deleteall
			menushow = 0
			gosub, BrowserMenu
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and WinX < 22 and WinY <22) ; Taskbar fent vagy lent hidden
		{
			Menu, browserresize, add
			Menu, browserresize, deleteall
			menushow = 0
			gosub, BrowserMenu
		}
		
		If (TbY=Mon1Bottom and WinX < 22 and WinY <22 and ClickY < Mon1Bottom)
		{
			Menu, browserresize, add
			Menu, browserresize, deleteall
			menushow = 0
			gosub, BrowserMenu
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and WinX < 22 and WinY <22) ;secondary monitor
	{
		Menu, browserresize, add
		Menu, browserresize, deleteall
		menushow = 0
		gosub, BrowserMenu
	}
}

return

BrowserMenu:
DetectHiddenWindows, On
WinClose, ahk_class #32768
WinWaitClose, ahk_class #32768
DetectHiddenWindows, Off


Menu, browserresize, add, Subtract taskbar height from below values, Subtract30pxTaskbarSizeFromHeight


if taskbarcheck =1
{
	Menu, browserresize, check, Subtract taskbar height from below values
}
if taskbarcheck =0
{
	Menu, browserresize, uncheck, Subtract taskbar height from below values
}


If menushow = 0
{
	Menu, browserresize, add
	menushow = 1
}	

Menu, browserresize, add, ----- WideScreen 16:10 -----, dummy
Menu, browserresize, add, 1920 x 1200, 1920x1200
Menu, browserresize, add, 1680 x 1050, 1680x1050
Menu, browserresize, add, 1440 x 900, 1440x900
Menu, browserresize, add, 1280 x 800, 1280x800
Menu, browserresize, add, ----- FullScreen 4:3 -----, dummy
Menu, browserresize, add, 1600 x 1200, 1600x1200
Menu, browserresize, add, 1400 x 1050, 1400x1050
Menu, browserresize, add, 1280 x 960, 1280x960
Menu, browserresize, add, 1024 x 768, 1024x768
Menu, browserresize, add, ----- FullScreen 5:4 -----, dummy
Menu, browserresize, add, 1280 x 1024,1280x1024
Menu, browserresize, add, ----- HDTV 16:9 -----, dummy
Menu, browserresize, add, 1080p, 1920x1080
Menu, browserresize, add, 720p, 1280x720
Menu, browserresize, add, ----- Other -----, dummy
Menu, browserresize, add, 1366 x 768, 1366x768
Menu, browserresize, add, 800 x 600, 800x600
Menu, browserresize, add, ----- Netbook -----, dummy
Menu, browserresize, add, 1024 x 600, 1024x600
Menu, browserresize, add, 800 x 480, 800x480
Menu, browserresize, add, ----- Handhelds -----, dummy
Menu, browserresize, add, 1024 x 1024 - iPad, 1024x1024
Menu, browserresize, add, 320 x 480 - iPhone, 320x480
Menu, browserresize, add, 480 x 272 - PSP, 480x272
Menu, browserresize, add, 240 x 320 - Cell, 240x320




Menu, browserresize, UseErrorLevel
Menu, browserresize, show, %WinX%, %WinY%
;msgbox, ez az
return



Subtract30pxTaskbarSizeFromHeight:
Menu, browserresize, ToggleCheck, Subtract30pxTaskbarSizeFromHeight
	If taskbarcheck<>1
	{
		taskbarcheck=1
	}
	else
	{
		taskbarcheck = 0
	}
goto BrowserMenu
return


dummy:
goto BrowserMenu
return


240x320:
Width=240
Height=320
gosub ResizeIt
return

320x480:
Width=320
Height=480
gosub ResizeIt
return

480x272:
Width=480
Height=272
gosub ResizeIt
return

800x480:
Width=800
Height=480
gosub ResizeIt
return

800x600:
Width=800
Height=600
gosub ResizeIt
return

1024x600:
Width=1024
Height=600
gosub ResizeIt
return

1024x768:
Width=1024
Height=768
gosub ResizeIt
return

1024x1024:
Width=1024
Height=1024
gosub ResizeIt
return

1280x720:
Width=1280
Height=720
gosub ResizeIt
return

1280x800:
Width=1280
Height=800
gosub ResizeIt
return

1280x960:
Width=1280
Height=960
gosub ResizeIt
return

1280x1024:
Width=1280
Height=1024
gosub ResizeIt
return

1366x768:
Width=1366
Height=768
gosub ResizeIt
return

1400x1050:
Width=1400
Height=1050
gosub ResizeIt
return

1440x900:
Width=1440
Height=900
gosub ResizeIt
return

1600x1200:
Width=1600
Height=1200
gosub ResizeIt
return

1680x1050:
Width=1680
Height=1050
gosub ResizeIt
return

1920x1080:
Width=1920
Height=1080
gosub ResizeIt
return

1920x1200:
Width=1920
Height=1200
gosub ResizeIt
return

ResizeIt:
If taskbarcheck=1
{
Height := Height-30
}
ActId := WindowUnderMouseID
Snap%ActId% =0
WinMove, ahk_id %WindowUnderMouseID%,,,, %Width%, %Height%
return