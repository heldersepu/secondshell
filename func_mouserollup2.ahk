~^RButton up::
If EnableTitlebarClicks = 1
{
	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2
	sysget, Monitor1, Monitor, 1
	sysget, Monitor2, Monitor, 2
	sysget, SM_CYCAPTION, 4
	sysget, SM_CYFULLSCREEN, 17
	sysget, SM_CXMAXIMIZED, 61
	sysget, SM_CYMAXIMIZED, 62
	WinGetPos,TbX,TbY, TbW, TbH, ahk_class Shell_TrayWnd

	XOffset=0
		
	setformat, float, 0.0
	Offset:=(SM_CXMAXIMIZED-(Mon1Right-Mon1Left))/2
		
	
	;WinClose, ahk_class #32768
	CoordMode, Mouse, Screen
	MouseGetPos, ClickX, ClickY, WindowUnderMouseID

	WinGetPos, RollX, RollY, RollW, RollH, ahk_id %WindowUnderMouseID%
	Win2X := ClickX-RollX
	Win2Y := ClickY-RollY
	WinGet, MaxState%WindowUnderMouseID%, MinMax, ahk_id %WindowUnderMouseID%

	If (MaxState%WindowUnderMouseID% = 1)
	{
	XOffset := Offset
	}
	
	If (ClickX >= Mon1Left-XOffset and ClickX < Mon1Right-XOffset) ;primary monitor
	{
		M=1
		If (TbY=0 and Win2X > 22 and Win2Y <22 and ClickY>Monitor1Top+TbH)  ;Taskbar fent es latszik
		{
			gosub RollGeometrics
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and Win2X > 22 and Win2Y <22) ; Taskbar fent vagy lent hidden
		{
			gosub RollGeometrics
		}
		
		If (TbY=Mon1Bottom and Win2X > 22 and Win2Y <22 and ClickY < Mon1Bottom)
		{
			gosub RollGeometrics
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and Win2X > 22 and Win2Y <22) ;secondary monitor
	{
		M=2
		gosub RollGeometrics
	}	
	
	
	
	
	
}
return


RollGeometrics:
RollX%WindowUnderMouseID% := RollX
RollY%WindowUnderMouseID% := RollY
RollW%WindowUnderMouseID% := RollW
If Roll%WindowUnderMouseID% <1
{
	PreRollH%WindowUnderMouseID% := RollH
	Roll%WindowUnderMouseID%=0
}
Gosub Roller

return

Roller:
If Roll%WindowUnderMouseID% = 0 ;ROLLUP
{
	Roll%WindowUnderMouseID% := 1
	
		
	If (MaxState%WindowUnderMouseID% = 1 and M=1) ;primary monitor
	{
		RollX%WindowUnderMouseID% := Mon1Left
		RollY%WindowUnderMouseID% := Mon1Top
		RollW%WindowUnderMouseID% := Mon1Right - Mon1Left
		WinRestore, ahk_id %WindowUnderMouseID%
	}

	If (MaxState%WindowUnderMouseID% = 1 and M=2) ;secondary monitor
	{
	
		RollX%WindowUnderMouseID% := Mon2Left
		RollY%WindowUnderMouseID% := Mon2Top
		RollW%WindowUnderMouseID% := Mon2Right - Mon2Left
		WinRestore, ahk_id %WindowUnderMouseID%
	}
	
	WinMove, ahk_id %WindowUnderMouseID%,, RollX%WindowUnderMouseID%, RollY%WindowUnderMouseID%, RollW%WindowUnderMouseID%, %RollUpHeight%
	DetectHiddenWindows, On
	WinClose, ahk_class #32768
	DetectHiddenWindows, Off
}

else  ;ROLLDOWN
{
	Roll%WindowUnderMouseID% := 0
	WinMove, ahk_id %WindowUnderMouseID%,, RollX%WindowUnderMouseID%, RollY%WindowUnderMouseID%, RollW%WindowUnderMouseID%, PreRollH%WindowUnderMouseID%
	DetectHiddenWindows, On
	WinClose, ahk_class #32768
	DetectHiddenWindows, Off
}
return