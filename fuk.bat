@echo off
cd /d %~dp0
call init.bat
timeout %initialTimeout%
set id=%date:~6,4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%%time:~6,2%

::Create Shortcuts------------------------------------------------------------------------------------------------------------------------
start /min /high /wait Shortcut.vbs %id% "%~dp0fuk.bat" %iconName% "%~dp0src\img\jail.ico" %iconsCount%

::Change Wallpaper
powershell -ExecutionPolicy RemoteSigned -File "%~dp0src\wallpaper.ps1"

::Volume to 100%--------------------------------------------------------------------------------------------------------------------------
SetVol.exe unmute
SetVol.exe %volume%

::Play sound------------------------------------------------------------------------------------------------------------------------------
start /min /high sound.vbs "%~dp0src\sfx\stalker.mp3"
timeout 5
start /min /high sound.vbs "%~dp0src\sfx\congrats.mp3"

::Change Wallpaper Loop------------------------------------------------------------------------------------------------------------------------
for /l %%x in (1, 1, %wallpaperSwapCount%) do (
	powershell -ExecutionPolicy RemoteSigned -File "%~dp0src\wallpaper.ps1"
	timeout %wallpaperTimeout%
)

Exit /b