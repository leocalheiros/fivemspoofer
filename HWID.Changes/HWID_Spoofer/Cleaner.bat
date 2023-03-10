@echo off

rem Set backup directory path
set "backup_dir=C:\MasculineUnban\SDIO\"

rem Check if the backup directory exists
if not exist "%backup_dir%" (
  rem If the backup directory does not exist, create it
  md "%backup_dir%"
)

rem Display instructions for the user
title MasculineUnban - Cleaner - First run of cleaner only - backing up drivers
cls
echo This is your first run of MasculineUnban, so we are backing up drivers just in case.
echo To do this, we will open snappy driver installer orgin.
echo 1. When it opens, click "download indexes only".
echo 2. Then wait for it to load and find your network card.
echo 3. Click your network card and then click install.
echo 4. Once it's done installing, exit snappy driver installer.
echo.

rem Run the driver installer program
start /wait SDIO_x64_R748.exe

rem Check if the driver installer program ran successfully
if errorlevel 1 (
  rem If the driver installer program failed, display an error message and exit with an exit code of 1
  echo There was an error running the driver installer.
  pause
  exit /b 1
)


rem Modify registry keys related to still image events
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\Connected" /v GUID /t REG_SZ /d "{A28BBADE-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\Disconnected" /v GUID /t REG_SZ /d "{143E4E83-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\EmailImage" /v GUID /t REG_SZ /d "{C66DCEE1-%Hex1%-%Hex0%-%Hex1%-2F%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\FaxImage" /v GUID /t REG_SZ /d "{C00EB793-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\PrintImage" /v GUID /t REG_SZ /d "{B441F425-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\ScanButton" /v GUID /t REG_SZ /d "{A6C5A715-%Hex1%-%Hex0%-%Hex1%-00%Hex10%}" /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\StillImage\Events\STIproxyEvent" /v GUID /t REG_SZ /d "{d711f81f-%Hex1%-%Hex0%-%Hex1%-92%Hex10%}" /f

rem Pause for a few seconds
ping localhost -n 3
