:: Create an executable using ahk2exe then
:: Make the installer using NSIS

:: Tested with:
::  python-2.7.msi
::  nsis-2.46-setup.exe
::  http://nsis.sourceforge.net/KillProc_plug-in

@COLOR 02
:: clean up before starting
@DEL *.exe
@CD ..
@DEL *.exe
@DEL *.bak /s

@ECHO.
@ECHO.
@ECHO  CLEANING COMPLETE!   READY TO START?
@ECHO.
@PAUSE

:: Launch the AutoHotkey setup
@COPY setup\setup.* .
SET Ahk2Exe="%ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe"
IF NOT EXIST %Ahk2Exe% SET Ahk2Exe="%ProgramFiles(x86)%\AutoHotkey\Compiler\Ahk2Exe.exe"
CALL %Ahk2Exe%  /in "secondshell.ahk" /icon "icons\active.ico"

:: Few seconds delay
@COLOR F0
@ECHO.
@ECHO   secondshell.exe created
@PING 1.1 /n 4 /i 1 > NUL
@COLOR 03

:: Launch the NSIS setup
@COLOR 07
SET NSIS="%ProgramFiles%\NSIS\makensis.exe"
IF NOT EXIST %NSIS% SET NSIS="%ProgramFiles(x86)%\NSIS\makensis.exe"
CALL %NSIS% setup.nsi
@ECHO.

:: clean up at the end
@DEL setup.* /q

@ECHO.
@ECHO.
@COLOR 0A
@MOVE *-*.exe setup
@ECHO.
@PAUSE
@DEL *.exe
