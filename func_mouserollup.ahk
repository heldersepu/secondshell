~^RButton up::
If EnableTitlebarClicks = 1
{
	SysGet, Mon, MonitorWorkArea

	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2

	sysget, SM_CXMAXIMIZED, 61
	sysget, SM_CYMAXIMIZED, 62


	XOffset=0
		
	setformat, float, 0.0
	Offset:=(SM_CXMAXIMIZED-(Mon1Right-Mon1Left))/2
		
	
	WinClose, ahk_class #32768
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
	
	
	
	If (RollX >= Mon1Left-XOffset and RollX < Mon1Right-XOffset) ;primary monitor
	{
		;msgbox 1top %Mon1Top% ,1bot %Mon1Bottom% ,2top %Mon2Top% ,1bot %Mon2Bottom%
	
		If Mon1Top > 0 ;taskbar fent
		{
			If (Win2X > 22 and Win2Y <22 and ClickY>Mon1Top)
			{ 
				gosub RollGeometrics
			}
		}

		If Mon1Top=0 ;taskbar lent  ... vagy fent es autohide
		{
			If (Win2X > 22 and Win2Y <22 and ClickY<Mon1Bottom)
			{ 
				gosub RollGeometrics
			}
		}
	}
	
	If (RollX >= Mon2Left-XOffset and RollX<Mon2Right-XOffset) ;secondary monitor
	{
	;msgbox %Mon1Right% %XOffset% ClickY:%ClickY% RollY:%RollY% Win2Y:%Win2Y%      ClickX:%ClickX% RollX:%RollX% Win2X:%Win2X%   mon2bottom:%Mon2Bottom% mon2top:%Mon2Top%
		If Mon2Top > 0 ;taskbar fent
		{
			If (Win2X > 22 and Win2Y <22 and ClickY>Mon2Top)
			{ 
				gosub RollGeometrics
			}
		}

		If Mon2Top=0 ;taskbar lent  ... vagy fent es autohide vagy sec mon es nincs
		{
			If (Win2X > 22 and Win2Y <22 and ClickY<Mon2Bottom)
			{ 
				gosub RollGeometrics
			}
		}
	}
}
return


RollGeometrics:
;WinGetPos, RollX, RollY, RollW, RollH, ahk_id %WindowUnderMouseID%
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
	
	If (MaxState%WindowUnderMouseID% = 1 and  RollX=Mon1Left-Offset)
	{
		XOffset := Offset
	}
	
	If (MaxState%WindowUnderMouseID% = 1 and  RollX=Mon2Left-Offset)
	{
		XOffset := Offset
	}	
	
	
	If (MaxState%WindowUnderMouseID% = 1 and Mon1Right > RollX and RollX>=Mon1Left-XOffset) ;primary monitor
	{
		RollX%WindowUnderMouseID% := Mon1Left
		RollY%WindowUnderMouseID% := Mon1Top
		RollW%WindowUnderMouseID% := Mon1Right - Mon1Left
		WinRestore, ahk_id %WindowUnderMouseID%
	}

	If (MaxState%WindowUnderMouseID% = 1 and RollX >= Mon2Left-XOffset and RollX<Mon2Right) ;secondary monitor
	{
	
		RollX%WindowUnderMouseID% := Mon2Left
		RollY%WindowUnderMouseID% := Mon2Top
		RollW%WindowUnderMouseID% := Mon2Right - Mon2Left
		WinRestore, ahk_id %WindowUnderMouseID%
	}
	
	WinMove, ahk_id %WindowUnderMouseID%,, RollX%WindowUnderMouseID%, RollY%WindowUnderMouseID%, RollW%WindowUnderMouseID%, %RollUpHeight%
	WinClose, ahk_class #32768
}

else  ;ROLLDOWN
{
	Roll%WindowUnderMouseID% := 0
	WinMove, ahk_id %WindowUnderMouseID%,, RollX%WindowUnderMouseID%, RollY%WindowUnderMouseID%, RollW%WindowUnderMouseID%, PreRollH%WindowUnderMouseID%
	WinClose, ahk_class #32768
}
return