SwapScreen:
	Sysget, MonNum, MonitorCount
	If MonNum =1
	{
	return
	}
	
	SysGet, Mon1, MonitorWorkArea, 1
	SysGet, Mon2, MonitorWorkArea, 2
	sysget, Monitor1, Monitor, 1
	sysget, Monitor2, Monitor, 2
	sysget, SM_CYCAPTION, 4
	sysget, SM_CYFULLSCREEN, 17
	sysget, SM_CXMAXIMIZED, 61
	sysget, SM_CYMAXIMIZED, 62
	
	XOffset=0
	setformat, float, 0.0
	Offset:=(SM_CXMAXIMIZED-(Mon1Right-Mon1Left))/2
	
WinGet, ActPid, PID, A
WinGet, ActId, ID, A
WinGetClass, ActClass, A
WinGet, stilus, style, ahk_class %ActClass%
WinGet, MaxState%ActId%, MinMax, ahk_id %ActId%
Process, Exist, explorer.exe
ExpPid := ErrorLevel
WinGetPos,TbX,TbY, TbW, TbH, ahk_class Shell_TrayWnd

	If (MaxState%ActId% = 1)
	{
	XOffset := Offset
	}

;msgbox, stilus:%stilus% class:%ActClass%


; Atmeretezheto az adott classhoz tartozo ablak, es nem explorer a processz
;CabinetWClass mehetne azert
;------------

IfEqual, ActClass, CabinetWclass
{
	gosub Swap
	goto jumphere3
}
OR  (stilus & 0x40000) AND (ActPid <> ExpPid) 
{
;	IfNotInString, ActClass, SideBar
	If ActClass not contains ROCKET,SideBar,TrueLaunch,AutoHotkeyGUI
	{	
		gosub Swap
	}
}
jumphere3:
return

Swap:

;winminimize, ahk_id %ActId%
WinGetPos, ActX, ActY, ActW, ActH, ahk_id %ActId%
Snap%ActId% :=0
	X00%ActId% :=
	Y00%ActId% :=
	W00%ActId% :=
	H00%ActId% :=
	HorMax%ActId% := 0
	VerMax%ActId% := 0
If (ActX >= Mon1Left-XOffset and ActX < Mon1Right-XOffset) ;primary monitor
{
	If Mon2Left>0 ; jobbra van a secondary
	{
	WinMove, ahk_id %ActId%,,ActX+Mon1Right,,,
	}
	If Mon2Left<0 ; balra van a secondary
	{
	WinMove, ahk_id %ActId%,,ActX-Mon1Right,,,
	}
}	
If (ActX >= Mon2Left-XOffset and ActX<Mon2Right-XOffset) ;secondary monitor
{
	If ActX>0 ;jobb oldalon van a secondary
	{
		WinMove, ahk_id %ActId%,,ActX-Mon2Left,,,
	}
	If ActX<0 ; bal oldalon van a secondary
	{
		WinMove, ahk_id %ActId%,,ActX+(Mon2Right-Mon2Left),,,
	}
	
}	
return