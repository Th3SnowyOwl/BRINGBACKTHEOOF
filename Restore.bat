@echo off
set cf=%cd%
set startup="%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
set startup=%startup:"=%

:netcheck
ping example.com -n 1 | findstr not
if %errorlevel% NEQ 0 (
goto check
) else (
cls
echo You are not connected to the internet, please connect to continue
pause
goto netcheck
)
goto netcheck

:check
echo Thanks For Using RestoreOOF
timeout /t 1
if exist "%startup%\Restore_AD.bat" (goto update_AD) else (if exist "%startup%\Restore_PF.bat" (goto update_PF) else (goto install))

:install
cd %localappdata%\Roblox\Versions\
if %errorlevel% equ 1 (goto pf86) else (goto appdata)

:pf86
cd "C:\Program Files (x86)\Roblox\Versions\"
copy "%cf%\Restore.bat" "%startup%"
cd "%startup%"
ren Restore.bat Restore_PF.bat
move "%cf%\Restore.bat" "%homedrive%%homepath%\Documents"
cd "%homedrive%%homepath%\Documents"
ren Restore.bat Update.bat
goto check

:appdata
cd %localappdata%\Roblox\Versions\
copy "%cf%\Restore.bat" "%startup%"
cd "%startup%"
ren Restore.bat Restore_AD.bat
move "%cf%\Restore.bat" "%homedrive%%homepath%\Documents"
cd "%homedrive%%homepath%\Documents"
goto check

:update_PF
cd "C:\Program Files (x86)\Roblox\Versions\"
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
goto replace

:update_AD
cd %localappdata%\Roblox\Versions\
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
goto replace

:replace
cd "%playerdir:RobloxPlayerLauncher.exe=%\content\sounds\"
del ouch.ogg
if exist "%HOMEDRIVE%%HOMEPATH%\Documents\ouch.ogg" (copy "%HOMEDRIVE%%HOMEPATH%\Documents\ouch.ogg" "%cd%") else (goto default)
exit
:default
curl -o ouch.ogg https://raw.githubusercontent.com/Th3SnowyOwl/RESTOREOOF/main/ouch.ogg
exit
