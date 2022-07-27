cd %appdata%
cd ..
cd local/Roblox/Versions/
for /f "tokens=*" %%a in ('dir RobloxPlayerLauncher.exe /b /s') do set playerdir=%%a
cd %playerdir:RobloxPlayerLauncher.exe=%
cd content/sounds/
del ouch.ogg
curl -s -o https://raw.githubusercontent.com/Th3SnowyOwl/BRINGBACKTHEOOF/main/ouch.ogg
