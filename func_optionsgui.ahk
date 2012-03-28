Options:
gui, +toolwindow
gui, add, tab2, w500 h400,Titlebar Clicks|Move && Resize|Custom Hotkeys|Miscellaneous
;gui, add, tab, w800 h400,Titlebar Clicks|Move && Resize|Custom Hotkeys|Miscellaneous
; TITLEBAR CLICKS GUI ELEMENTS
Gui, Add, GroupBox, w450 h80 , Titlebar options
Gui, Add, checkbox, x40 y60 vEnableTitlebarClicks Checked%titleclicks%, Enable Titlebarclicks?



;MOVE AND RESIZE GUI ELEMENTS
gui, tab,2
Gui, Add, GroupBox, w320 h170 , Vertical and horizontal maximization
Gui, Add, checkbox, x40 y60 vEnablemax Checked%enamax% gEnaHorVer, Enable Horizontal and Vertical maximization?
Gui, Add, Text,x40 y90,Horizontal Maximize:
Gui, Add, Hotkey, X180 Yp-3 vHorizontalMax1, %HorizontalMaximize1%
Gui, Add, Text,x40 yp+30,Horizontal Maximize (Alt):
Gui, Add, Hotkey, X180 Yp-3 vHorizontalMax2, %HorizontalMaximize2%
Gui, Add, Text,x40 yp+30,Vertical Maximize:
Gui, Add, Hotkey, X180 Yp-3 vVerticalMax1, %VerticalMaximize1%
Gui, Add, Text,x40 yp+30,Vertical Maximize (Alt):
Gui, Add, Hotkey, X180 Yp-3 vVerticalMax2, %VerticalMaximize2%



;CUSTOM HOTKEYS GUI ELEMENTS
gui, tab,3
gui, add, text, BackgroundTrans ,3


;MISCELLANEOUS OPTIONS GUI ELEMENTS
gui, tab, 4
Gui, Add, GroupBox, w300 h80 , Miscellaneous options
Gui, Add, Checkbox, x40 y60 vEnableSplash Checked%enasplash%, Enable Splash Screen?
Gui, Add, Checkbox, vCapsLockEnable Checked%CapsMidClick% , Change CapsLock to middle mouse button?

;OUTSIDE OF THE TABS
Gui, Tab
Gui, Add, Button,w100 x10 y420 , OK
Gui, Add, Button,w100 x110 y420 Default, Cancel
Gui, Add, Button, w100 x210 y420, Apply




;SHOW THE GUI
Gui, show,h450 ,SecondShell Options



return

ButtonApply:
gui, submit, nohide
iniwrite, %EnableSplash%, %A_Scriptdir%\secondshell.ini, EnableSplash, EnableSplashScreen
iniwrite, %CapsLockEnable%, %A_Scriptdir%\secondshell.ini, MapCapsLockToMiddleClick, EnableCapsMiddleClick
goto OptionsApplied
return

ButtonOK:
gosub ButtonApply
gui, destroy
return

EnaHorVer:

return