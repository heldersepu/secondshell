~WheelDown::

If EnableTitlebarClicks = 1
{
	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2
	
	CoordMode, Mouse, Screen
	MouseGetPos, ClickX, ClickY, WindowUnderMouseID
	
	CoordMode, Mouse, Relative
	MouseGetPos, WinX,WinY,WindowUnderMouseID

	WinGetClass, ActClass1, ahk_id %WindowUnderMouseID%

	If ActClass1 contains BaseBar 
	{
		return
	}

	If ActClass1 contains TLBHOST
	{
		return
	}
	
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
	
	
	If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
	{
		If (TbY=0 and WinX > 22 and WinY <22 and ClickY>Monitor1Top+TbH)  ;Taskbar fent es latszik
		{
			gosub, DecreaseWindowSize
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and WinX > 22 and WinY <22) ; Taskbar fent vagy lent hidden
		{
			gosub, DecreaseWindowSize
		}
		
		If (TbY=Mon1Bottom and WinX > 22 and WinY <22 and ClickY < Mon1Bottom)
		{
			gosub, DecreaseWindowSize
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and WinX > 22 and WinY <22) ;secondary monitor
	{
		gosub, DecreaseWindowSize
	}


}
return




~WheelUp::

If EnableTitlebarClicks = 1
{
	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2
	
	CoordMode, Mouse, Screen
	MouseGetPos, ClickX, ClickY, WindowUnderMouseID
	
	CoordMode, Mouse, Relative
	MouseGetPos, WinX,WinY,WindowUnderMouseID

	WinGetClass, ActClass1, ahk_id %WindowUnderMouseID%

	If ActClass1 contains BaseBar 
	{
		return
	}

	If ActClass1 contains TLBHOST
	{
		return
	}
	
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
	
	
	If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
	{
		If (TbY=0 and WinX > 22 and WinY <22 and ClickY>Monitor1Top+TbH)  ;Taskbar fent es latszik
		{
			gosub, IncreaseWindowSize
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and WinX > 22 and WinY <22) ; Taskbar fent vagy lent hidden
		{
			gosub, IncreaseWindowSize
		}
		
		If (TbY=Mon1Bottom and WinX > 22 and WinY <22 and ClickY < Mon1Bottom)
		{
			gosub, IncreaseWindowSize
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and WinX > 22 and WinY <22) ;secondary monitor
	{
		gosub, IncreaseWindowSize
	}


}
return
