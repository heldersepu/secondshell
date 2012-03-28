RightSnap:
action=Right
gosub SnapDecision
return

LeftSnap:
action=Left
gosub SnapDecision
return

TopSnap:
action=Top
gosub SnapDecision
return

BottomSnap:
action=Bottom
gosub SnapDecision
return

NWSnap:
action=NW
gosub SnapDecision
return

NESnap:
action=NE
gosub SnapDecision
return

SWSnap:
action=SW
gosub SnapDecision
return

SESnap:
action=SE
gosub SnapDecision
return

FullSnap:
action=Full
gosub SnapDecision
return
	
SnapDecision:
WinGet, ActPid, PID, A
WinGet, ActId, ID, A
WinGetClass, ActClass, A
WinGet, stilus, style, ahk_class %ActClass%

WinGet, MaxState%ActId%, MinMax, ahk_id %ActId%

Process, Exist, explorer.exe
ExpPid := ErrorLevel

IfEqual, ActClass, CabinetWclass
	{
	gosub SnapGeometrics
	return
	}
OR  (stilus & 0x40000) AND (ActPid <> ExpPid) 
	{
;	IfNotInString, ActClass, SideBar
	If ActClass not contains ROCKET,SideBar,TrueLaunch,AutoHotkeyGUI
	{	
	gosub SnapGeometrics
	}
	return
	}
return
	
SnapGeometrics:
SysGet, Mon1, MonitorWorkArea, 1
SysGet, Mon2, MonitorWorkArea, 2
sysget, SM_CXMAXIMIZED, 61
sysget, SM_CYMAXIMIZED, 62

;msgbox, mon1top:%Mon1Top% mon1left:%Mon1Left% mon1right:%Mon1Right% Mon1Bottom:%Mon1Bottom%
;msgbox, mon2top:%Mon2Top% mon2left:%Mon2Left% mon2right:%Mon2Right% Mon2Bottom:%Mon2Bottom%

WinGetPos, ActX, ActY, ActW, ActH, ahk_id %ActId%

	If Snap%ActId% <1
	{
	X00%ActId% := ActX
	Y00%ActId% := ActY
	W00%ActId% := ActW
	H00%ActId% := ActH
	Snap%ActId%=0
	}
	;msgbox % ActX " " ActW
	
	XOffset=0
		
	
	setformat, float, 0.0
	Offset:=(SM_CXMAXIMIZED-(Mon1Right-Mon1Left))/2
	
	
	
	If (MaxState%ActId% = 1 and  ActX=Mon1Left-Offset)
	{
	XOffset := Offset
	}
	
	If (MaxState%ActId% = 1 and  ActX=Mon2Left-Offset)
	{
	XOffset := Offset
	}	
	
	If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
		{
		Top := Mon1Top
		Left := Mon1Left
		Height := Mon1Bottom-Mon1Top
		Width := Mon1Right-Mon1Left
		
	
		If action=Right
			{
			Snap%ActId% := Snap%ActId%+1
			Left := Width/2
			Width := Width/2
			gosub Snapper
			}		
		If action=Left
			{
			Snap%ActId% := Snap%ActId%+10
			Width := Width/2
			gosub Snapper
			}		
		If action=Top
			{
			Snap%ActId% := Snap%ActId%+100
			Height := Height/2
			gosub Snapper
			}		
		If action=Bottom
			{
			Snap%ActId% := Snap%ActId%+1000
			Top := Height/2+Top
			Height := Height/2
			gosub Snapper
			}			
		If action=NW
			{
			Snap%ActId% := Snap%ActId%+10000
			Width := Width/2
			Height := Height/2
			gosub Snapper
			}	
		If action=NE
			{
			Snap%ActId% := Snap%ActId%+100000
			Left := Width/2
			Width := Width/2
			Height := Height/2
			gosub Snapper
			}	
		If action=SW
			{
			Snap%ActId% := Snap%ActId%+1000000
			Width := Width/2
			Top := Height/2+Top
			Height := Height/2
			gosub Snapper
			}	
		If action=SE
			{
			Snap%ActId% := Snap%ActId%+10000000
			Left := Width/2
			Top := Height/2+Top
			Width := Width/2
			Height := Height/2
			gosub Snapper
			}	

		If action=Full
			{
			Snap%ActId% := Snap%ActId%+100000000
			gosub Snapper
			}
			
		}
		
		If (ActX >= Mon2Left-XOffset and ActX<Mon2Right-XOffset) ;secondary monitor
		{
		Top := Mon2Top
		Left := Mon2Left
		Height := Mon2Bottom-Mon2Top
		Width := Mon2Right-Mon2Left
		
			If action=Right
			{
			Snap%ActId% := Snap%ActId%+1
			Left := Mon2Left+((Mon2Right-Mon2Left)/2)
			Width:= (Mon2Right-Mon2Left)/2
			gosub Snapper
			}		
			If action=Left
			{
			Snap%ActId% := Snap%ActId%+10
			Width:= (Mon2Right-Mon2Left)/2
			gosub Snapper
			}		
			If action=Top
			{
			Snap%ActId% := Snap%ActId%+100
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}		
			If action=Bottom
			{
			Snap%ActId% := Snap%ActId%+1000
			Top := (Mon2Bottom-Mon2Top)/2+Top
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}			
			If action=NW
			{
			Snap%ActId% := Snap%ActId%+10000
			Width := (Mon2Right-Mon2Left)/2
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}	
			If action=NE
			{
			Snap%ActId% := Snap%ActId%+100000
			Left := Mon2Left+((Mon2Right-Mon2Left)/2)
			Width:= (Mon2Right-Mon2Left)/2
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}	
			If action=SW
			{
			Snap%ActId% := Snap%ActId%+1000000
			Width := (Mon2Right-Mon2Left)/2
			Top := (Mon2Bottom-Mon2Top)/2+Top
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}	
			If action=SE
			{
			Snap%ActId% := Snap%ActId%+10000000
			Left := Mon2Left+((Mon2Right-Mon2Left)/2)
			Top := (Mon2Bottom-Mon2Top)/2+Top
			Width := (Mon2Right-Mon2Left)/2
			Height := (Mon2Bottom-Mon2Top)/2
			gosub Snapper
			}	
			
			If action=Full
			{
			Snap%ActId% := Snap%ActId%+100000000
			gosub Snapper
			}
		
		}
				
return

Snapper:
IfInString, Snap%ActId%, 2
{
	;v := Snap%ActId%
	;msgbox %v%
	;msgbox % MaxState%ActId%
	Snap%ActId% := 0
	If MaxStateOrig%ActId% =1
	{
		WinMaximize, ahk_id %ActId%
		MaxStateOrig%ActId% =0
	}
	else
	{
		WinMove, ahk_id %ActId%,,X00%ActId%,Y00%ActId%,W00%ActId%,H00%ActId%
	}
}
else
{
	If MaxState%ActId% =1
	{
		MaxStateOrig%ActId% =1
		WinRestore, ahk_id %ActId%
	}
	WinMove,ahk_id %ActId%,,%Left%,%Top%,%Width%,%Height%
	
}
return