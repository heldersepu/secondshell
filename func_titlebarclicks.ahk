~RButton up::

If EnableTitlebarClicks = 1
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

	If ActClass1 contains BaseBar 
	{
		return
	}

	If ActClass1 contains TLBHOST
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


	If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
	{
		If (TbY=0 and WinX > 22 and WinY <22 and ClickY>Monitor1Top+TbH)  ;Taskbar fent es latszik
		{
			WinMinimize, ahk_id %WindowUnderMouseID%
			WinClose, ahk_class #32768
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and WinX > 22 and WinY <22) ; Taskbar fent vagy lent hidden
		{
			WinMinimize, ahk_id %WindowUnderMouseID%
			WinClose, ahk_class #32768
		}
		
		If (TbY=Mon1Bottom and WinX > 22 and WinY <22 and ClickY < Mon1Bottom)
		{
			WinMinimize, ahk_id %WindowUnderMouseID%
			WinClose, ahk_class #32768
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and WinX > 22 and WinY <22) ;secondary monitor
	{
		WinMinimize, ahk_id %WindowUnderMouseID%
		WinClose, ahk_class #32768
	}

;If (SM_CYCAPTION+SM_CYFULLSCREEN = MonitorBottom-MonitorTop and TbY = 0 and TbX+TbW=MonitorRight+MonitorLeft)
;teljes ablak lefedi a keprnyot ES latszik fent taskbar ES taskbar szelesseg = primary kepernyo szelesseg
;{
;MonTop := MonTop + TbH
;}

;If (TbX+TbW=MonitorRight+MonitorLeft and SM_CYCAPTION+SM_CYFULLSCREEN = MonitorBottom-MonitorTop and TbY+TbH=MonitorBottom )
;{
;MonBottom := Monbottom - TbH
;}

;taskbar fent
;If MonTop > 0
;{
;	If (WinX > 22 and WinY <22 and ClickY>MonTop)
;	{ 
;	WinMinimize, ahk_id %WindowUnderMouseID%
;	WinClose, ahk_class #32768
;	}
;}

;taskbar lent
;If MonTop=0
;{
;	;MsgBox, %WinX% %WinY% %ClickX% %ClickY% %MonTop% %MonBottom%
;	If (WinX > 22 and WinY <22 and ClickY<MonBottom)
;	{ 
;	WinMinimize, ahk_id %WindowUnderMouseID%
;	WinClose, ahk_class #32768
;	}
;}
}
return



~MButton up::
CloseWindow:

If EnableTitlebarClicks = 1
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
	
	If ActClass1 contains TLBHOST
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
		If (TbY=0 and WinX > 22 and WinY <22 and ClickY>Mon1Top)  ;Taskbar fent es latszik
		{
			WinClose, ahk_class #32768
			WinClose, ahk_id %WindowUnderMouseID%
		}
		
		If ((TbY<0 or TbY > Monitor1Bottom-TbH) and WinX > 22 and WinY <22) ; Taskbar fent vagy lent hidden
		{
			WinClose, ahk_class #32768
			WinClose, ahk_id %WindowUnderMouseID%
		}
		
		If (TbY=Mon1Bottom and WinX > 22 and WinY <22 and ClickY < Mon1Bottom)
		{
			WinClose, ahk_class #32768
			WinClose, ahk_id %WindowUnderMouseID%
		}
	}
	
	If (ClickX >= Mon2Left-XOffset and ClickX<Mon2Right-XOffset and WinX > 22 and WinY <22) ;secondary monitor
	{
		WinClose, ahk_class #32768
		WinClose, ahk_id %WindowUnderMouseID%
	}
}




;If EnableTitlebarClicks = 1
;{
;	SysGet, Mon, MonitorWorkArea
;
;	CoordMode, Mouse, Screen
;	MouseGetPos, ClickX, ClickY, WindowUnderMouseID
;
;	CoordMode, Mouse, Relative
;	MouseGetPos, WinX,WinY,WindowUnderMouseID
;
;	If (WinX>22 and WinY<22)
;	{
;		WinClose, ahk_id %WindowUnderMouseID%
;		WinClose, ahk_class #32768
;	}
;}


;If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
;{
;    Send #{Right} ; or your double-right-click action here
;}

return
