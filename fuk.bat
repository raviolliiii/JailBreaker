@echo off
cd /d %~dp0
call init.bat
timeout %initialTimeout%
set id=%date:~6,4%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%%time:~6,2%

::Create Shortcuts------------------------------------------------------------------------------------------------------------------------
start /min /high /wait Shortcut.vbs %id% "%~dp0fuk.bat" %iconName% "%~dp0src\img\jail.ico" %iconsCount%

::Change Wallpaper
::reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0src\img\uwu.bmp" /f 
::RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

::Volume to 100%--------------------------------------------------------------------------------------------------------------------------
SetVol.exe unmute
SetVol.exe %volume%

::Play sound------------------------------------------------------------------------------------------------------------------------------
start /min /high sound.vbs "%~dp0src\sfx\stalker.mp3"
timeout 5
start /min /high sound.vbs "%~dp0src\sfx\congrats.mp3"

::Change Wallpaper Loop------------------------------------------------------------------------------------------------------------------------
for /l %%x in (1, 1, %wallpaperSwapCount%) do (
	reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%~dp0src\img\uwu.bmp" /f 
	RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
	timeout %wallpaperTimeout%
)

Exit /b