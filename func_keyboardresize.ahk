;horizontal and vertical maximize

;---------------------
;CTRL+ALT+Right Arrow
;---------------------
;^!Right::
;^!Left::
HorizontalMaximize:
WinGet, ActPid, PID, A
WinGet, ActId, ID, A
WinGetClass, ActClass, A
WinGet, stilus, style, ahk_class %ActClass%
WinGet, MaxState, MinMax, ahk_id %ActId%
Process, Exist, explorer.exe
ExpPid := ErrorLevel
;msgbox, stilus:%stilus% class:%ActClass%

If MaxState = 1
	{
	X00%ActId% :=
	Y00%ActId% :=
	W00%ActId% :=
	H00%ActId% :=
	HorMax%ActId% := 0
	VerMax%ActId% := 0
	return
	}





; Atmeretezheto az adott classhoz tartozo ablak, es nem explorer a processz
;CabinetWClass mehetne azert
;------------


IfEqual, ActClass, CabinetWclass
	{
	action=Horizontal
	gosub Maximize
	goto jumphere
	}
OR  (stilus & 0x40000) AND (ActPid <> ExpPid) 
	{
;	IfNotInString, ActClass, SideBar
	If ActClass not contains ROCKET,SideBar,TrueLaunch,AutoHotkeyGUI
	{	
	action=Horizontal
	gosub Maximize
	}
	}
jumphere:
	return




;---------------------
;CTRL+ALT+Up Arrow
;---------------------
;^!Up::
;^!Down::
VerticalMaximize:
WinGet, ActPid, PID, A
WinGet, ActId, ID, A
WinGetClass, ActClass, A
WinGet, stilus, style, ahk_class %ActClass%
WinGet, MaxState, MinMax, ahk_id %ActId%
Process, Exist, explorer.exe
ExpPid := ErrorLevel

If MaxState = 1
	{
	X00%ActId% :=
	Y00%ActId% :=
	W00%ActId% :=
	H00%ActId% :=
	HorMax%ActId% := 0
	VerMax%ActId% := 0
	return
	}



; Atmeretehzheto az adott classhoz tartozo ablak, es nem explorer a processz
;------------
;
; innen is kivettem a %-ot
;
;If ( ActClass = CabinetWClass 
;OR (stilus & 0x40000) AND (ActPid <> ExpPid))
;	{
;	action=Vertical
;	gosub Maximize
;	}
;return

IfEqual, ActClass, CabinetWclass
	{
	action=Vertical
	gosub Maximize
	goto jumphere2
	}
OR  (stilus & 0x40000) AND (ActPid <> ExpPid)
	{
;	IfNotInString, ActClass, SideBar
	If ActClass not contains ROCKET,SideBar,TrueLaunch,AutoHotkeyGUI
	{	
	action=Vertical
	gosub Maximize
	}
	}
jumphere2:
	return




;---------------------
;Horizontal / Vertical / Full Maximize and Restore
;---------------------
Maximize:

SysGet, Mon1, MonitorWorkArea, 1
SysGet, Mon2, MonitorWorkArea, 2




;NEITHER Horizontally NOR Vertically maximized
;---------------------
If (HorMax%ActId% !=1 AND VerMax%ActId% !=1)
	{
	WinGetPos, ActX, ActY, ActW, ActH, ahk_id %ActId%
	X00%ActId% := ActX
	Y00%ActId% := ActY
	W00%ActId% := ActW
	H00%ActId% := ActH
	HorMax%ActId% := 0
	VerMax%ActId% := 0

	If (ActX < Mon1Left and ActX >= Mon2Left) ;secondary, balra a primarytol
	{
		Top := Mon2Top
		Left := Mon2Left
		Height := Mon2Bottom-Mon2Top
		Width := Mon2Right-Mon2Left
	}
	
	
	If (ActX >= Mon1Left and ActX < Mon1Right) ; primary
	{
		Top := Mon1Top
		Left := Mon1Left
		Height := Mon1Bottom-Mon1Top
		Width := Mon1Right-Mon1Left
	}
		
		
	If (ActX >= Mon1Right and ActX < Mon2Right) ; secondary, jobbra a primarytol
	{
		Top := Mon2Top
		Left := Mon2Left
		Height := Mon2Bottom-Mon2Top
		Width := Mon2Right-Mon2Left
	}



	If action=horizontal
	{
		WinMove,ahk_id %ActId%,,%Left%,Y00%ActId%,%Width%, Default
		HorMax%ActId% := 1
		VerMax%ActId% := 0
	}
	If action=vertical
	{
		WinMove,ahk_id %ActId%,,X00%ActId%,%Top%,Default,%Height%
		HorMax%ActId% := 0
		VerMax%ActId% := 1
	}
	return
	}

;EITHER Horizontally OR Vertically maximized
;---------------------
If (HorMax%ActId% + VerMax%ActId% = 1)
	{
	WinGetPos, ActX, ActY, ActW, ActH, ahk_id %ActId%


	If (Mon1Right > ActX)
		{
		Top := Mon1Top
		Left := Mon1Left
		Height := Mon1Bottom-Mon1Top
		Width := Mon1Right-Mon1Left
		}
	If (ActX > Mon1Right)
		{
		Top := Mon2Top
		Left := Mon2Left
		Height := Mon2Bottom-Mon2Top
		Width := Mon2Right-Mon2Left
		}


	If ((action="horizontal" AND VerMax%ActId% = 1) OR (action="vertical" AND HorMax%ActId%=1))
		{
		WinMove,ahk_id %ActId%,,%Left%,%Top%,%Width%,%Height%
		HorMax%ActId% := 1
		VerMax%ActId% := 1

		}
	else
		{
		WinMove,ahk_id %ActId%,,X00%ActId%,Y00%ActId%,W00%ActId%, H00%ActId%
		HorMax%ActId% := 0
		VerMax%ActId% := 0

		}
	return	
}

;BOTH Horizontally AND Vertically maximized
;---------------------
If (HorMax%ActId% + VerMax%ActId% = 2)
	{

	WinMove,ahk_id %ActId%,,X00%ActId%,Y00%ActId%,W00%ActId%, H00%ActId%
	HorMax%ActId% := 0
	VerMax%ActId% := 0
	
	return	
}