@setlocal enableextensions enabledelayedexpansion
@echo off
TITLE VMSNAP!

REM Change the 2 following lines with your own parameters
set path=""
set vm=""

cd %path%
set list_vms="VBoxManage.exe list runningvms"
FOR /F "tokens=*" %%i IN (' %list_vms% ') DO SET result=%%i

REM checks if the list of running vms contains our vm
if not "x!result:%vm%=!"=="x%result%" (
	REM FOUND!
	goto found  
) else (
	goto end
	REM goto:eof  ??
)

:found
REM time format: DD_MM_YYYY-HH:mm
set date=%DATE:~0,2%_%DATE:~3,2%_%DATE:~6,4%-%TIME:~0,5%
echo Taking a snapshot of %vm% ...
start "" "VBoxManage.exe" snapshot "%vm%" take "%date%" --live
pause

:end
