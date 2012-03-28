DisplayShortcuts:
gosub GuiClose

HM1=%HorizontalMaximize1%
StringReplace, HM1, HM1, ^, Ctrl-
StringReplace, HM1, HM1, !, Alt-
StringReplace, HM1, HM1, #, Win-
StringReplace, HM1, HM1, +, Shift-
StringReplace, HM1, HM1, Right, RightArrow
StringReplace, HM1, HM1, Left, LeftArrow
StringReplace, HM1, HM1, Up, UpArrow
StringReplace, HM1, HM1, Down, DownArrow

HM2=%HorizontalMaximize2%
StringReplace, HM2, HM2, ^, Ctrl-
StringReplace, HM2, HM2, !, Alt-
StringReplace, HM2, HM2, #, Win-
StringReplace, HM2, HM2, +, Shift-
StringReplace, HM2, HM2, Right, RightArrow
StringReplace, HM2, HM2, Left, LeftArrow
StringReplace, HM2, HM2, Up, UpArrow
StringReplace, HM2, HM2, Down, DownArrow

VM1=%VerticalMaximize1%
StringReplace, VM1, VM1,^, Ctrl-
StringReplace, VM1, VM1, !, Alt-
StringReplace, VM1, VM1, #, Win-
StringReplace, VM1, VM1, +, Shift-
StringReplace, VM1, VM1, Right, RightArrow
StringReplace, VM1, VM1, Left, LeftArrow
StringReplace, VM1, VM1, Up, UpArrow
StringReplace, VM1, VM1, Down, DownArrow

VM2=%VerticalMaximize2%
StringReplace, VM2, VM2, ^, Ctrl-
StringReplace, VM2, VM2, !, Alt-
StringReplace, VM2, VM2, #, Win-
StringReplace, VM2, VM2, +, Shift-
StringReplace, VM2, VM2, Right, RightArrow
StringReplace, VM2, VM2, Left, LeftArrow
StringReplace, VM2, VM2, Up, UpArrow
StringReplace, VM2, VM2, Down, DownArrow


TE=%ToggleEnable%
StringReplace, TE, TE, ^, Ctrl-
StringReplace, TE , TE, !, Alt-
StringReplace, TE, TE, #, Win-
StringReplace, TE, TE, +, Shift-
StringReplace, TE, TE, Right, RightArrow
StringReplace, TE, TE, Left, LeftArrow
StringReplace, TE, TE, Up, UpArrow
StringReplace, TE, TE, Down, DownArrow

gui, +toolwindow
gui, font, bold underline
Gui, add, text,,1.) Keyboard shortcut - Toggle Horizontal/Vertical Maximize:
gui, font, normal
Gui, add, text,,Toggle Horizontal Maximization:  
Gui, add, text,x200 yp ,%HM1%
Gui, add, text,yp+14,%HM2%
Gui, add, text,x10,Toggle Vertical Maximization:
Gui, add, text,x200 yp,%VM1%
Gui, add, text,yp+14,%VM2%

gui, font, bold underline
Gui, add, text,x10 yp+40,2.) Mouse Shortcut - Move And Resize:
gui, font, normal
Gui, add, text,,Move Window: 
Gui, add, text,x200 yp,Alt-LeftMouseButton Drag
Gui, add, text,x10,Resize Window:
Gui, add, text,x200 yp,Alt-RightMouseButton Drag


gui, font, bold underline
Gui, add, text,x10 yp+40,3.) Mouse Shortcut - Minimize And Close Windows
gui, font, normal
Gui, add, text,,Minimize Window: 
Gui, add, text,x200 yp,Right-click the Titlebar
Gui, add, text,x10,Close Window:
Gui, add, text,x200 yp,Middle-click the Titlebar
If CapsMidClick=true
{
Gui, add, text,yp+20,Hover mouse over the Titlebar
Gui, add, text,yp+14,and press CapsLock
}

gui, font, bold underline
Gui, add, text,x10 yp+40,4.) Enable / Disable secondshell
gui, font, normal
Gui, add, text,,Enable/Disable: 
Gui, add, text,x200 yp, %TE%
Gui, add, text, yp+14, Doubleclick tray icon
Gui, show, , secondshell - List of shortcuts

return

About:
gosub GuiClose
gui, +toolwindow
gui, color, 000000
gui, add, picture, , icons\secondshellsplash.jpg
gui, font, cffffff s20
gui, add, text,x430 y18,V. 2.0.1
Gui, Font, s10
gui, add, button, gUpdateChecker x45 y470 w250, Check for updates
Gui, Add, button, gLaunchSite x305 yp w250, Visit http://www.secondshell.com
Gui, Font, norm
Gui, add, text, x35 y560 , Resizing unresizable windows is cool, huh? :)
gui, show, w600 h505 ,About:SecondShell
return

LaunchSite:
Run www.secondshell.com
goto GuiClose
return


ButtonCancel:
GuiClose:
GuiEscape:
Gui, Destroy
return

;^CapsLock::
Suspend:
Suspend, Toggle
If A_IsSuspended =1
	{
	Menu, Tray, Icon, icons\inactive.ico,,1
	Menu, Tray, Check, Suspend
	}
else
	{
	Menu, Tray, Icon, icons\active.ico
	Menu, Tray, Uncheck, Suspend
	}
return

Reload:
Reload
return

Exit:
exitapp
return