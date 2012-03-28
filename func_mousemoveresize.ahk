
; This is the setting that runs smoothest on my
; system. Depending on your video card and cpu
; power, you may want to raise or lower this value.


SetWinDelay, 2

CoordMode,Mouse

;!LButton up::
;RestoreCursors()
;return

!LButton::
; Get the initial mouse position and window id, and
; abort if the window is maximized.
If EnableMouseMoveResize = 1
{
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
	IfWinNotActive, Task Switching
	{
		;SetSystemCursor("IDC_SIZEALL")
		WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; Move the window to the new position.
		If EnableMoveResizeToolTip=1
		{
			WinGetPos, MoveX,MoveY, MoveW, MoveH,ahk_id %KDE_id%
			ToolTip, Position:   X:%MoveX% Y:%MoveY% `nSize:           %MoveW% x %MoveH%
			SetTimer, RemoveToolTip, 200
		}	
		
	}
	else
	{
	click
	}
}
}
return



RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip

return

!RButton::
If EnableMouseMoveResize = 1
{
; Get the initial mouse position and window id, and
; abort if the window is maximized.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; Get the initial window position and size.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
; Define the window region the mouse is currently in.
; The four regions are Up and Left, Up and Right, Down and Left, Down and Right.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
   KDE_WinLeft := 1
Else
   KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
   KDE_WinUp := 1
Else
   KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; Break if button has been released.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; Get the current mouse position.
    ; Get the current window position and size.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position.
    KDE_Y2 -= KDE_Y1
    ; Then, act according to the defined region.
	IfWinNotActive, Task Switching
	{
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; X of resized window
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; Y of resized window
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; W of resized window
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; H of resized window
    KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
	
	If EnableMoveResizeToolTip=1
	{
		WinGetPos, MoveX,MoveY, MoveW, MoveH,ahk_id %KDE_id%
		ToolTip, Position:   X:%MoveX% Y:%MoveY% `nSize:           %MoveW% x %MoveH%
		SetTimer, RemoveToolTip, 200
	}
	}
}
}
return

return

; This detects "double-clicks" of the alt key.
;~Alt::
;DoubleAlt := A_PriorHotKey = "~Alt" AND A_TimeSincePriorHotkey < 400
;Sleep 0
;KeyWait Alt  ; This prevents the keyboard's auto-repeat feature from interfering.
; return