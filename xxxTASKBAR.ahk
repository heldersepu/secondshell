sysget, SM_CXMAXIMIZED, 61
sysget, SM_CYMAXIMIZED, 62
msgbox % SM_CXMAXIMIZED " " SM_CYMAXIMIZED



sysget, Monitor, Monitor
sysget, MonWorkArea, MonitorWorkArea
sysget, SM_CYCAPTION, 4
sysget, SM_CYFULLSCREEN, 17
sysget,MonPrimary,MonitorPrimary
WinGetPos,TbX,TbY, TbW, TbH, ahk_class Shell_TrayWnd

;msgbox, %blahTop% %workareablahTop%
; 4 SM_CYCAPTION: Height of a caption area, in pixels. 
;msgbox, ha %SM_CYCAPTION%+%SM_CYFULLSCREEN% =1050 -> autohide kulnben nem autohide



if TbY<0
{
location = top_hidden
}
if TbY=0
{
location=top_nothidden
}
if TbY>0
{
location = bottom
}



If SM_CYCAPTION+SM_CYFULLSCREEN = MonitorBottom-MonitorTop
msgbox location: %location%, autohide on, taskbar height: %tbH%
if SM_CYCAPTION+SM_CYFULLSCREEN+TbH=MonitorBottom-MonitorTop
msgbox location: %location%, autohide: off,  taskbar height: %tbH%


;msgbox % "Taskbar Width: " . tbW . "`nTaskbar Height: " . tbH  "upper left: " x y

;WinShow ahk_class Shell_TrayWnd
;WinActivate ahk_class Shell_TrayWnd

