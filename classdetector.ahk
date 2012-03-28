~RButton up::

CoordMode, Mouse, Screen
MouseGetPos, ClickX, ClickY, WindowUnderMouseID

Wingetclass, neededclass, ahk_id %WindowUnderMouseID%

msgbox, %neededclass%

return