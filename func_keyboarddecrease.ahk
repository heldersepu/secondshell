IncreaseWindowSize:
action=increase
gosub ResizeDecision
return

DecreaseWindowSize:
action=decrease
gosub ResizeDecision
return

ResizeDecision:
WinGet, ActPid, PID, A
WinGet, ActId, ID, A
WinGetClass, ActClass, A
WinGet, stilus, style, ahk_class %ActClass%
WinGet, MaxState%ActId%, MinMax, ahk_id %ActId%
Process, Exist, explorer.exe
ExpPid := ErrorLevel?

IfEqual, ActClass, CabinetWclass
	{
	gosub ResizeGeometrics
	return
	}
OR  (stilus & 0x40000) AND (ActPid <> ExpPid) 
	{
;	IfNotInString, ActClass, SideBar
	If ActClass not contains ROCKET,SideBar,TrueLaunch,AutoHotkeyGUI
	{	
	gosub ResizeGeometrics
	}
	return
	}
return

ResizeGeometrics:
SysGet, Mon1, MonitorWorkArea, 1
SysGet, Mon2, MonitorWorkArea, 2
sysget, SM_CXMAXIMIZED, 61
sysget, SM_CYMAXIMIZED, 62

WinGetPos, ActX, ActY, ActW, ActH, ahk_id %ActId%

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

	If Decr%ActId% <1
	{
	XD00%ActId% := ActX
	YD00%ActId% := ActY
	WD00%ActId% := ActW
	HD00%ActId% := ActH
	Decr%ActId%=0
	}
	If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
	{
		if action=increase
		{
			Width:=ActW+Increment
			Height:=ActH+Increment
			
			Top := YD00%ActId%
			Left := XD00%ActId%
			
		
			If Left + Width	< Mon1Right
			{
				goto Height1
			}
			else
			{
				Left:=Left-( (Left+Width)-(Mon1Right))
					
				If Left>=%Mon1Left%
				{
					goto Height1
				}
				else
				{
					Left=%Mon1Left%
					Width=%Mon1Right%
					goto Height1
				}
			}
			Height1:
			;goto Resize
			If Top + Height	< Mon1Bottom
				{
				goto Resize
				}
			else
			;If Increment-((Top+Height)-Mon1Bottom)<Top-Mon1Top
				{
				Top := Top-((Top+Height)-Mon1Bottom)
				If Top > %Mon1Top%
					{
					goto Resize
					}
				else
					{
					Top=%Mon1Top%
					Height:=Mon1Bottom-Mon1Top
					goto Resize					
					}
				}
			}
			
			
		if action=decrease
			{
				Width:=ActW-Decrement
				Height:=ActH-Decrement
				
				Top := YD00%ActId%
				Left := XD00%ActId%		
			
				If Width < 100
				{
					Width = 100
				}
				If Height < 100
				{
					Height = 100
				}
			
				If (MaxState%ActId% = 1)
				{
					XOffset := Offset
					WinRestore, ahk_id %ActId%
					Left := Mon1Left
					Top := Mon1Top
				}
			goto Resize
			}
		}
		
		If (ActX >= Mon2Left-XOffset and ActX<Mon2Right-XOffset) ;secondary monitor		
		{
			if action=increase
			{
				Width:=ActW+Increment
				Height:=ActH+Increment
			
				Top := YD00%ActId%
				Left := XD00%ActId%
			
		
				If Left + Width	< Mon2Right
				{
					goto Height2
				}
				else
				{
					Left:=Left-( (Left+Width)-(Mon2Right))
					
					If Left>=%Mon2Left%
					{
						goto Height2
					}
					else
					{
						Left=%Mon2Left%
						Width:=Mon2Right-Mon2Left
						goto Height2
					}
				
				}
				Height2:
				;goto Resize
				If Top + Height	< Mon2Bottom
				{
					goto Resize
				}
				else
				{
					Top := Top-((Top+Height)-Mon2Bottom)
					If Top > %Mon2Top%
					{
						goto Resize
					}
					else
					{
						Top=%Mon2Top%
						Height:=Mon2Bottom-Mon2Top
						goto Resize					
					}
				}
			}
			
			
			if action=decrease
			{
				Width:=ActW-Decrement
				Height:=ActH-Decrement
			
				Top := YD00%ActId%
				Left := XD00%ActId%		
			
				If Width < 100
				{
					Width = 100
				}
				If Height < 100
				{
					Height = 100
				}
				If (MaxState%ActId% = 1)
				{
					XOffset := Offset
					WinRestore, ahk_id %ActId%
					Left := Mon2Left
					Top := Mon2Top
				}
				goto Resize
			}
		}
		
		
		
return


Resize:
Snap%ActId%=0
WinMove, ahk_id %ActId%,,Left,Top,Width,Height
return