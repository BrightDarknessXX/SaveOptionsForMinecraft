@echo off
Title Option Saver v2.0 for Minecraft Java 

if not exist "OptionSaverMC" (md OptionSaverMC)
cd OptionSaverMC

set mcloglast=optionsmclast.log
set mclog=optionsmc.log

echo Option Saver for Minecraft Java [Version 2.0]
echo by _BrightDarkness_
Echo.
echo (Help for help page)

:1
echo.
set /p PV=
if /i "[%PV%]"=="[save]" (goto save)
if /i "[%PV%]"=="[save /NBTONLY]" (goto saveNBTONLY)
if /i "[%PV%]"=="[save /MODONLY]" (goto saveMODONLY)
if /i "[%PV%]"=="[load]" (goto load)
if /i "[%PV%]"=="[load /NBTONLY]" (goto loadNBTONLY)
if /i "[%PV%]"=="[load /MODONLY]" (goto loadMODONLY)
if /i "[%PV%]"=="[log]" (goto log)
if /i "[%PV%]"=="[help]" (goto help)
if /i "[%PV%]"=="[clean]" (goto clean)
if /i "[%PV%]"=="[list]" (echo. & dir /b & echo. & goto 1)
if /i "[%PV%]"=="[x]" (exit)

echo.
echo %PV% is no option.
goto 1

REM HELP (self explanatory)
:help
echo.
echo SAVE [/NBTONLY] [/MODONLY]
echo Saves options.
echo -NBTONLY  Only copies the .NBT file.
echo -MODONLY  Only copies the mod folder.
echo.
echo LOAD [/NBTONLY] [/MODONLY]
echo Loads options to use in Minecraft.
echo -NBTONLY  Only loads the .NBT file.
echo -MODONLY  Only loads the mod folder.
echo.
echo LOG
echo Shows what you've loaded/saved in a log format.
echo.
echo CLEAN
echo Deletes a save.
echo.
echo LIST
echo Lists the OptionSaverMC folder.
echo.
echo HELP
echo Shows this help page.
echo.
echo X
echo Exits the program.

goto 1

REM Shows the log of what has been loaded or saved
:log
echo.
if exist "%mclog%" (
type %mclog%
) else (
Echo No log yet.
)

goto 1


REM Pastes the version you choose
:load
echo.

echo Your profiles:
dir /b options*.txt
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=Load options for version:
echo [%date% %time%] Last loaded version: %ver% > %mcloglast%
echo [%date% %time%] Loaded %ver% >> %mclog%
echo.

if exist "options %ver%.txt" (
del ..\options.txt
copy "options %ver%.txt" "..\options.txt"
echo OK!   options %ver%.txt
echo OK!   options.txt >> %mclog%
echo OK!   options.txt >> %mcloglast%
) else (
echo MISSING!   options %ver%.txt
echo MISSING!   options.txt >> %mclog%
echo MISSING!   options.txt >> %mcloglast%
)

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
echo OK!   hotbar.nbt >> %mclog%
echo OK!   hotbar.nbt >> %mcloglast%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %mclog%
echo MISSING!   hotbar.nbt >> %mcloglast%
)

if exist "config %ver%" (
rd ..\config /S /Q
robocopy "config %ver%" "..\config" /MIR
echo OK!   config %ver%
echo OK!   config >> %mclog%
echo OK!   config >> %mcloglast%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %mclog%
echo MISSING!   config >> %mcloglast%
)

if exist "mods %ver%" (
rd ..\mods /S /Q
robocopy "mods %ver%" "..\mods" /MIR
echo OK!   mods %ver%
echo OK!   mods >> %mclog%
echo OK!   mods >> %mcloglast%
) else (
echo MISSING!   mods %ver%
echo MISSING!   mods >> %mclog%
echo MISSING!   mods >> %mcloglast%
)

goto 1


REM Pastes the version you choose, but ONLY hotbar.nbt
:loadNBTONLY
echo.

echo Your profiles:
dir /b hotbar*.nbt
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=Load NBT for version:
echo [%date% %time%] Last loaded version: %ver% (NBTONLY) > %mcloglast%
echo [%date% %time%] Loaded %ver% (NBTONLY) >> %mclog%
echo.

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
echo OK!   hotbar.nbt >> %mclog%
echo OK!   hotbar.nbt >> %mcloglast%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %mclog%
echo MISSING!   hotbar.nbt >> %mcloglast%
)

goto 1


REM Pastes the version you choose, but ONLY the mods folder
:loadMODONLY
echo.

echo Your profiles:
dir /b mods*
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=Load MODS for version:
echo [%date% %time%] Last loaded version: %ver% (MODS) > %mcloglast%
echo [%date% %time%] Loaded %ver% (MODS) >> %mclog%
echo.

if exist "mods %ver%" (
rd ..\mods /S /Q
robocopy "mods %ver%" "..\mods" /MIR
echo OK!   mods %ver%
echo OK!   mods >> %mclog%
echo OK!   mods >> %mcloglast%
) else (
echo MISSING!   mods %ver%
echo MISSING!   mods >> %mclog%
echo MISSING!   mods >> %mcloglast%
)

goto 1


REM Saves the version to be restored when needed
:save
echo.

set /p ver=Save options as version:
echo [%date% %time%] Saved %ver% >> %mclog%
echo.

if exist "..\options.txt" (
copy "..\options.txt" "options %ver%.txt"
echo OK!   options.txt
echo OK!   options.txt >> %mclog%
) else (
echo MISSING!   options.txt
echo MISSING!   options.txt >> %mclog%
)

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
echo OK!   hotbar.nbt >> %mclog%
) else (
echo MISSING!   hotbar.nbt
echo MISSING!   hotbar.nbt >> %mclog%
)

if exist "..\config" (
robocopy "..\config" "config %ver%" /MIR
echo OK!   config
echo OK!   config >> %mclog%
) else (
echo MISSING!   config
echo MISSING!   config >> %mclog%
)

if exist "..\mods" (
robocopy "..\mods" "mods %ver%" /MIR
echo OK!   mods
echo OK!   mods >> %mclog%
) else (
echo MISSING!   mods
echo MISSING!   mods >> %mclog%
)

goto 1


REM Copies the hotbar.nbt for the version given
:saveNBTONLY
echo.

set /p ver=Save NBT as version:
echo [%date% %time%] Saved %ver% (NBTONLY) >> %mclog%
echo.

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
echo OK!   hotbar.nbt >> %mclog%
) else (
echo MISSING!   hotbar.nbt
echo MISSING!   hotbar.nbt >> %mclog%
)

goto 1


REM Copies the mods folder for the version given
:saveMODONLY
echo.

set /p ver=Save MODS as version:
echo [%date% %time%] Saved %ver% (MODS) >> %mclog%
echo.

if exist "..\mods" (
robocopy "..\mods" "mods %ver%" /MIR
echo OK!   mods
echo OK!   mods >> %mclog%
) else (
echo MISSING!   mods
echo MISSING!   mods >> %mclog%
)

goto 1


REM Delete an entry
:clean
echo.

echo Your profiles:
dir /b
echo.

echo Type 'CLEAN' to reset OptionSaverMC.
echo.
set /p ver=Delete version:
if /i "[%ver%]"=="[CLEAN]" (goto reset)
echo [%date% %time%] Deleted %ver% >> %mclog%
echo.

if exist "options %ver%.txt" (
del "options %ver%.txt" /S /Q >nul
echo DELETED!   options %ver%.txt
echo DELETED!   options.txt >> %mclog%
) else (
echo MISSING!   options %ver%.txt
echo MISSING!   options.txt >> %mclog%
)

if exist "hotbar %ver%.nbt" (
del "hotbar %ver%.nbt" /S /Q >nul
echo DELETED!   hotbar %ver%.nbt
echo DELETED!   hotbar.nbt >> %mclog%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %mclog%
)

if exist "config %ver%" (
rd "config %ver%" /S /Q >nul
echo DELETED!   config %ver%
echo DELETED!   config >> %mclog%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %mclog%
)

if exist "mods %ver%" (
rd "mods %ver%" /S /Q >nul
echo DELETED!   mods %ver%
echo DELETED!   mods >> %mclog%
) else (
echo MISSING!   mods %ver%
echo MISSING!   mods >> %mclog%
)

goto 1


REM Resets OptionSaverMC
:reset
echo.
dir /b
echo.
:resetERR
set /p ver=Are you sure you want to delete all files listed above? (Y/N) : 
if /i "[%ver%]"=="[Y]" (
    cd ..
    rd OptionSaverMC /S /Q
    exit
)
if /i "[%ver%]"=="[N]" (goto 1) else (goto resetERR)