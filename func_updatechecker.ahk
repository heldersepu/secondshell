UpdateChecker:
if FileExist("%A_Scriptdir%\version*")
{
;FileDelete, version.html
;msgbox, ott van
}
;return
UrlDownloadToFile, *0 http://www.secondshell.com/version.html, %A_Scriptdir%\version.html
FileReadLine, LatestVersion, %A_Scriptdir%\version.html,2

IfNotInString, LatestVersion, Latest Version:
{
msgbox, Update checking failed. Please try again later.
return
}

ifinstring,  LatestVersion, %CurrentVersion%
{
gosub GuiClose
gui, +toolwindow
gui, add, text,,No updates found.
gui, add, button,x50,Cancel
gui, show,w150,SecondShell Update
FileDelete, version.html
}
else
{
gosub GuiClose
gui, +toolwindow
gui, add, text,,SecondShell has a new version.
gui, add, text,,Visit
Gui, Font, underline
Gui, Add, text, gLaunchSite x+2 yp cblue, www.secondshell.com
Gui, Font, norm
gui, add, text, x+2 yp, to download.
gui, add, button,x80 y+15,Cancel
gui, show,,SecondShell Update
FileDelete, version.html
}
return
