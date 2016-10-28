@setlocal enableextensions enabledelayedexpansion
@echo off
TITLE SNAPSHOT!
REM a comment line


set path="C:\Program Files\Oracle\VirtualBox"
set vm="marrakchino"

cd %path%
set list_vms="VBoxManage.exe list runningvms"
FOR /F "tokens=*" %%i IN (' %list_vms% ') DO SET result=%%i

REM checks if the list of running vms contains the our vm
if not "x!result:%vm%=!"=="x%result%" (
	REM FOUND!
	goto found
) else (
	goto end
	REM goto:eof??
)

:found
set date=%DATE:~0,2%_%DATE:~3,2%_%DATE:~6,4%-%TIME:~1,4%
set take_snapshot="VBoxManage.exe snaphot %vm% take %date% --live"
echo %date%
pause

:end
