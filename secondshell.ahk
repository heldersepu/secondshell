#SingleInstance ignore
#WinActivateForce
#include menu.ahk
;show the splash if needed
Iniread, enasplash, %A_Scriptdir%\secondshell.ini, EnableSplash, EnableSplashScreen
If enasplash=1	
{
	SplashImage, %A_Scriptdir%\icons\secondshellsplash.jpg
	sleep, 2000
	SplashImage, Off
}
CurrentVersion := "201"

OptionsApplied:

#include iniread_hotkeys.ahk
;#include func_mischotkeys.ahk
#include customhotkeys.ahk

; innen label-ek jonnek return visszateressel

#include func_mousemoveresize.ahk
#include func_mouserollup2.ahk
#include func_titlebarwheels.ahk
#include func_titlebarclicks.ahk

#include func_keyboardresize.ahk
#include func_capslock.ahk
#include func_customhotkeys.ahk
#include func_keyboardsnap.ahk
#include func_keyboarddecrease.ahk
#include func_updatechecker.ahk
#include func_swapscreen.ahk
#include func_browserresize.ahk
#include func_optionsgui.ahk
#include func_menugui.ahk
; #include func_cursorsetting.ahk
