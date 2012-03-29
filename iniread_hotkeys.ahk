Iniread, EnableHorizontalVerticalMaximize, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableHorizontalVerticalMaximize
If EnableHorizontalVerticalMaximize = 1
{
Iniread, HorizontalMaximize1, %A_Scriptdir%\secondshell.ini, AppHotkeys, HorizontalMaximize1
Iniread, HorizontalMaximize2, %A_Scriptdir%\secondshell.ini, AppHotkeys, HorizontalMaximize2
Iniread, VerticalMaximize1, %A_Scriptdir%\secondshell.ini, AppHotkeys, VerticalMaximize1
Iniread, VerticalMaximize2, %A_Scriptdir%\secondshell.ini, AppHotkeys, VerticalMaximize2
Iniread, ToggleEnable, %A_Scriptdir%\secondshell.ini, AppHotkeys, ToggleEnable

Hotkey, %ToggleEnable%, Suspend
Hotkey, %HorizontalMaximize1%, HorizontalMaximize
Hotkey, %HorizontalMaximize2%, HorizontalMaximize
Hotkey, %VerticalMaximize1%, VerticalMaximize
Hotkey, %VerticalMaximize2%, VerticalMaximize
}

IniRead, CapsMidClick, %A_Scriptdir%\secondshell.ini, MapCapsLockToMiddleClick, EnableCapsMiddleClick
If CapsMidClick=1
{
Hotkey, CapsLock, CapsLock, UseErrorLevel
}

Iniread, EnableSnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableSnap
If EnableSnap = 1
{
Iniread, Rsnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, RightSnap
Hotkey, %Rsnap%, RightSnap
Iniread, Lsnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, LeftSnap
Hotkey, %Lsnap%, LeftSnap
Iniread, Tsnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, TopSnap
Hotkey, %Tsnap%, TopSnap
Iniread, Bsnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, BottomSnap
Hotkey, %Bsnap%, BottomSnap
Iniread, NWSnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, NWSnap
Hotkey, %NWSnap%, NWSnap
Iniread, NESnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, NESnap
Hotkey, %NESnap%, NESnap
Iniread, SWSnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, SWSnap
Hotkey, %SWSnap%, SWSnap
Iniread, SESnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, SESnap
Hotkey, %SESnap%, SESnap
Iniread, FullSnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, FullSnap
Hotkey, %FullSnap%, FullSnap
Iniread, DualSnap, %A_Scriptdir%\secondshell.ini, AppHotkeys, DualSnap
Hotkey, %DualSnap%, DualSnap
}

Iniread, EnableMouseMoveResize, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableMouseMoveResize
If EnableMouseMoveResize = 1
{
Iniread, Increment, %A_Scriptdir%\secondshell.ini, AppHotkeys, Increment
Iniread, Decrement, %A_Scriptdir%\secondshell.ini, AppHotkeys, Decrement
Iniread, Increase, %A_Scriptdir%\secondshell.ini, AppHotkeys, Increase
Hotkey, %Increase%, IncreaseWindowSize
Iniread, Decrease, %A_Scriptdir%\secondshell.ini, AppHotkeys, Decrease
Hotkey, %Decrease%, DecreaseWindowSize
}

Iniread, EnablePutWindowToOtherScreen, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnablePutWindowToOtherScreen
If EnablePutWindowToOtherScreen = 1
{
Iniread, PutWindowToOtherScreen, %A_Scriptdir%\secondshell.ini, AppHotkeys, PutWindowToOtherScreen
Hotkey, %PutWindowToOtherScreen%, SwapScreen
}

Iniread, EnableBrowserResize, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableBrowserResize


Iniread, EnableMouseMoveResize, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableMouseMoveResize
Iniread, EnableMoveResizeToolTip, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableMoveResizeToolTip
Iniread, EnableTitlebarClicks, %A_Scriptdir%\secondshell.ini, AppHotkeys, EnableTitlebarClicks
Iniread, RollUpHeight, %A_Scriptdir%\secondshell.ini, AppHotkeys, RollUpHeight

;Hotkey, ^!a, About
;Hotkey, ^!u, UpdateChecker
;Hotkey, ^r, Reload
;Hotkey, ^!o,Options
;Hotkey, ~MButton & WheelDown, AltTab
;Hotkey, ~MButton & WheelUp, ShiftAltTab


