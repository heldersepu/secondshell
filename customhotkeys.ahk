Iniread, EnableCustomHotkeys, %A_Scriptdir%\secondshell.ini, CustomHotkeys, EnableCustomHotkeys
If EnableCustomHotkeys=1
{

Iniread, app1, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application1
Iniread, hot1, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey1
Hotkey, %hot1%, LabelCustom1, UseErrorLevel

Iniread, app2, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application2
Iniread, hot2, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey2
Hotkey, %hot2%, LabelCustom2, UseErrorLevel

Iniread, app3, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application3
Iniread, hot3, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey3
Hotkey, %hot3%, LabelCustom3, UseErrorLevel

Iniread, app4, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application4
Iniread, hot4, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey4
Hotkey, %hot4%, LabelCustom4, UseErrorLevel

Iniread, app5, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application5
Iniread, hot5, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey5
Hotkey, %hot5%, LabelCustom5, UseErrorLevel

Iniread, app6, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application6
Iniread, hot6, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey6
Hotkey, %hot6%, LabelCustom6, UseErrorLevel

Iniread, app7, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application7
Iniread, hot7, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey7
Hotkey, %hot7%, LabelCustom7, UseErrorLevel

Iniread, app8, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application8
Iniread, hot8, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey8
Hotkey, %hot8%, LabelCustom8, UseErrorLevel

Iniread, app9, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application9
Iniread, hot9, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey9
Hotkey, %hot9%, LabelCustom9, UseErrorLevel

Iniread, app10, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Application10
Iniread, hot10, %A_Scriptdir%\secondshell.ini, CustomHotkeys, Hotkey10
Hotkey, %hot10%, LabelCustom10, UseErrorLevel
}