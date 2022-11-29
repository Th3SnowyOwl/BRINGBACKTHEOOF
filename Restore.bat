set startup="%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
set startup=%startup:"=%
if exist %startup%Restore.bat (goto start) else (goto copy)
goto start
:copy
copy Restore.bat "%startup%"
:start
cd %appdata%
cd /Roblox/Versions/
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
echo %playerdir% > temp
set /p temp=<temp
if not "%temp%" == "%playerdir%" (goto cont) else (exit)
:cont
cd %playerdir:RobloxPlayerLauncher.exe=%
cd content/sounds/
del ouch.ogg
curl -o ouch.ogg https://raw.githubusercontent.com/Th3SnowyOwl/BRINGBACKTHEOOF/main/ouch.ogg
cd C:\Program Files (x86)\Roblox\Versions\
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
if exist %playerdir% (goto cont2) else (exit)
:cont2
cd %playerdir:RobloxPlayerLauncher.exe=%
cd content/sounds/
del ouch.ogg
curl -o ouch.ogg https://raw.githubusercontent.com/Th3SnowyOwl/BRINGBACKTHEOOF/main/ouch.ogg