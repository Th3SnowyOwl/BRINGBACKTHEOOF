cd %appdata%
cd ..
cd local/Roblox/Versions/
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
if exist %playerdir% goto cont1
:cont1
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
pause
