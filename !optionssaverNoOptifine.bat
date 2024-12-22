@echo off
Title Option Saver v2.3 for Minecraft Java 

if not exist "OptionSaverMC" (md OptionSaverMC)
cd OptionSaverMC

set mcloglast=optionsmclast.log
set mclog=optionsmc.log

echo Option Saver for Minecraft Java [Version 2.3]
echo by _BrightDarkness_
Echo.
echo (Help for help page)

:1
echo.
set /p PV=
if /i "%PV%"=="save" (goto save)
if /i "%PV%"=="save /NBTONLY" (goto saveNBTONLY)
if /i "%PV%"=="save /MODONLY" (goto saveMODONLY)
if /i "%PV%"=="save /RESONLY" (goto saveRESONLY)
if /i "%PV%"=="load" (goto load)
if /i "%PV%"=="load /NBTONLY" (goto loadNBTONLY)
if /i "%PV%"=="load /MODONLY" (goto loadMODONLY)
if /i "%PV%"=="load /RESONLY" (goto loadRESONLY)
if /i "%PV%"=="log" (goto log)
if /i "%PV%"=="help" (goto help)
if /i "%PV%"=="clean" (goto clean)
if /i "%PV%"=="clear" (goto clear)
if /i "%PV%"=="list" (echo. & dir /b & echo. & goto 1)
if /i "%PV%"=="x" (exit)

echo.
echo %PV% is no option.
goto 1

:: HELP (self explanatory)
:help
echo.
echo SAVE [/NBTONLY] [/MODONLY]
echo Saves options.
echo -NBTONLY  Only copies the .NBT file.
echo -MODONLY  Only copies the mod folder.
echo -RESONLY  Only copies the resourcepacks folder.
echo.
echo LOAD [/NBTONLY] [/MODONLY] [/RESONLY]
echo Loads options to use in Minecraft.
echo -NBTONLY  Only loads the .NBT file.
echo -MODONLY  Only loads the mod folder.
echo -RESONLY  Only loads the resourcepacks folder.
echo.
echo LOG
echo Shows what you've loaded/saved in a log format.
echo.
echo CLEAN
echo Deletes a save.
echo.
echo CLEAR
echo Empties folders: mods, config, resourcepacks
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

:: Shows the log of what has been loaded or saved
:log
echo.
if exist "%mclog%" (
type %mclog%
) else (
Echo No log yet.
)

goto 1


:: Pastes the version you choose
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
    del ..\options.txt /F /Q  > nul 2>&1
    copy "options %ver%.txt" "..\options.txt"  > nul 2>&1
    echo OK!   options %ver%.txt
    echo OK!   options.txt >> %mclog%
    echo OK!   options.txt >> %mcloglast%
    ) else (
        echo MISSING!   options %ver%.txt
        echo MISSING!   options.txt >> %mclog%
        echo MISSING!   options.txt >> %mcloglast%
)

if exist "hotbar %ver%.nbt" (
    del ..\hotbar.nbt /F /Q  > nul 2>&1
    copy "hotbar %ver%.nbt" "..\hotbar.nbt"  > nul 2>&1
    echo OK!   hotbar %ver%.nbt
    echo OK!   hotbar.nbt >> %mclog%
    echo OK!   hotbar.nbt >> %mcloglast%
    ) else (
        echo MISSING!   hotbar %ver%.nbt
        echo MISSING!   hotbar.nbt >> %mclog%
        echo MISSING!   hotbar.nbt >> %mcloglast%
)

if exist "config %ver%" (
    robocopy "config %ver%" "..\config" /MIR  > nul 2>&1
    echo OK!   config %ver%
    echo OK!   config >> %mclog%
    echo OK!   config >> %mcloglast%
    ) else (
        echo MISSING!   config %ver%
        echo MISSING!   config >> %mclog%
        echo MISSING!   config >> %mcloglast%
)

if exist "mods %ver%" (
    robocopy "mods %ver%" "..\mods" /MIR  > nul 2>&1
    echo OK!   mods %ver%
    echo OK!   mods >> %mclog%
    echo OK!   mods >> %mcloglast%
    ) else (
        echo MISSING!   mods %ver%
        echo MISSING!   mods >> %mclog%
        echo MISSING!   mods >> %mcloglast%
)

if exist "resourcepacks %ver%" (
    robocopy "resourcepacks %ver%" "..\resourcepacks" /MIR  > nul 2>&1
    echo OK!   resourcepacks %ver%
    echo OK!   resourcepacks >> %mclog%
    echo OK!   resourcepacks >> %mcloglast%
    ) else (
        echo MISSING!   resourcepacks %ver%
        echo MISSING!   resourcepacks >> %mclog%
        echo MISSING!   resourcepacks >> %mcloglast%
)

goto 1


:: Pastes the version you choose, but ONLY hotbar.nbt
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
    del ..\hotbar.nbt /F /Q  > nul 2>&1
    copy "hotbar %ver%.nbt" "..\hotbar.nbt"  > nul 2>&1
    echo OK!   hotbar %ver%.nbt
    echo OK!   hotbar.nbt >> %mclog%
    echo OK!   hotbar.nbt >> %mcloglast%
    ) else (
        echo MISSING!   hotbar %ver%.nbt
        echo MISSING!   hotbar.nbt >> %mclog%
        echo MISSING!   hotbar.nbt >> %mcloglast%
)

goto 1


:: Pastes the version you choose, but ONLY the mods folder
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
    robocopy "mods %ver%" "..\mods" /MIR  > nul 2>&1
    echo OK!   mods %ver%
    echo OK!   mods >> %mclog%
    echo OK!   mods >> %mcloglast%
    ) else (
        echo MISSING!   mods %ver%
        echo MISSING!   mods >> %mclog%
        echo MISSING!   mods >> %mcloglast%
)

goto 1

:: Pastes the version you choose, but ONLY the resourcepacks folder
:loadRESONLY
echo.

echo Your profiles:
dir /b resourcepacks*
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=Load resourcepacks for version:
echo [%date% %time%] Last loaded version: %ver% (resourcepacks) > %mcloglast%
echo [%date% %time%] Loaded %ver% (resourcepacks) >> %mclog%
echo.

if exist "resourcepacks %ver%" (
    robocopy "resourcepacks %ver%" "..\resourcepacks" /MIR  > nul 2>&1
    echo OK!   resourcepacks %ver%
    echo OK!   resourcepacks >> %mclog%
    echo OK!   resourcepacks >> %mcloglast%
    ) else (
        echo MISSING!   resourcepacks %ver%
        echo MISSING!   resourcepacks >> %mclog%
        echo MISSING!   resourcepacks >> %mcloglast%
)

goto 1

:: Saves the version to be restored when needed
:save
echo.

set /p ver=Save options as version:
echo [%date% %time%] Saved %ver% >> %mclog%
echo.

if exist "..\options.txt" (
    del "options %ver%.txt" /F /Q  > nul 2>&1
    copy "..\options.txt" "options %ver%.txt"  > nul 2>&1
    echo OK!   options.txt
    echo OK!   options.txt >> %mclog%
    ) else (
        echo MISSING!   options.txt
        echo MISSING!   options.txt >> %mclog%
)

if exist "..\hotbar.nbt" (
    del "hotbar %ver%.nbt" /F /Q  > nul 2>&1
    copy "..\hotbar.nbt" "hotbar %ver%.nbt"  > nul 2>&1
    echo OK!   hotbar.nbt
    echo OK!   hotbar.nbt >> %mclog%
    ) else (
        echo MISSING!   hotbar.nbt
        echo MISSING!   hotbar.nbt >> %mclog%
)

if exist "..\config" (
    robocopy "..\config" "config %ver%" /MIR  > nul 2>&1
    echo OK!   config
    echo OK!   config >> %mclog%
    ) else (
        echo MISSING!   config
        echo MISSING!   config >> %mclog%
)

if exist "..\mods" (
    robocopy "..\mods" "mods %ver%" /MIR  > nul 2>&1
    echo OK!   mods
    echo OK!   mods >> %mclog%
    ) else (
        echo MISSING!   mods
        echo MISSING!   mods >> %mclog%
)

if exist "..\resourcepacks" (
    robocopy "..\resourcepacks" "resourcepacks %ver%" /MIR  > nul 2>&1
    echo OK!   resourcepacks
    echo OK!   resourcepacks >> %mclog%
    ) else (
        echo MISSING!   resourcepacks
        echo MISSING!   resourcepacks >> %mclog%
)

goto 1


:: Copies the hotbar.nbt for the version given
:saveNBTONLY
echo.

set /p ver=Save NBT as version:
echo [%date% %time%] Saved %ver% (NBTONLY) >> %mclog%
echo.

if exist "..\hotbar.nbt" (
    del "hotbar %ver%.nbt" /F /Q  > nul 2>&1
    copy "..\hotbar.nbt" "hotbar %ver%.nbt"  > nul 2>&1
    echo OK!   hotbar.nbt
    echo OK!   hotbar.nbt >> %mclog%
    ) else (
        echo MISSING!   hotbar.nbt
        echo MISSING!   hotbar.nbt >> %mclog%
)

goto 1


:: Copies the mods folder for the version given
:saveMODONLY
echo.

set /p ver=Save MODS as version:
echo [%date% %time%] Saved %ver% (MODS) >> %mclog%
echo.

if exist "..\mods" (
    robocopy "..\mods" "mods %ver%" /MIR  > nul 2>&1
    echo OK!   mods
    echo OK!   mods >> %mclog%
    ) else (
        echo MISSING!   mods
        echo MISSING!   mods >> %mclog%
)

goto 1

:: Copies the resourcepacks folder for the version given
:saveRESONLY
echo.

set /p ver=Save resourcepacks as version:
echo [%date% %time%] Saved %ver% (resourcepacks) >> %mclog%
echo.

if exist "..\resourcepacks" (
    robocopy "..\resourcepacks" "resourcepacks %ver%" /MIR  > nul 2>&1
    echo OK!   resourcepacks
    echo OK!   resourcepacks >> %mclog%
    ) else (
        echo MISSING!   resourcepacks
        echo MISSING!   resourcepacks >> %mclog%
)

goto 1

:: Delete an entry
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
    del "options %ver%.txt" /S /Q  > nul 2>&1
    echo DELETED!   options %ver%.txt
    echo DELETED!   options.txt >> %mclog%
    ) else (
        echo MISSING!   options %ver%.txt
        echo MISSING!   options.txt >> %mclog%
)

if exist "hotbar %ver%.nbt" (
    del "hotbar %ver%.nbt" /S /Q  > nul 2>&1
    echo DELETED!   hotbar %ver%.nbt
    echo DELETED!   hotbar.nbt >> %mclog%
    ) else (
        echo MISSING!   hotbar %ver%.nbt
        echo MISSING!   hotbar.nbt >> %mclog%
)

if exist "config %ver%" (
    rd "config %ver%" /S /Q  > nul 2>&1
    echo DELETED!   config %ver%
    echo DELETED!   config >> %mclog%
    ) else (
        echo MISSING!   config %ver%
        echo MISSING!   config >> %mclog%
)

if exist "mods %ver%" (
    rd "mods %ver%" /S /Q  > nul 2>&1
    echo DELETED!   mods %ver%
    echo DELETED!   mods >> %mclog%
    ) else (
        echo MISSING!   mods %ver%
        echo MISSING!   mods >> %mclog%
)

if exist "resourcepacks %ver%" (
    rd "resourcepacks %ver%" /S /Q  > nul 2>&1
    echo DELETED!   resourcepacks %ver%
    echo DELETED!   resourcepacks >> %mclog%
    ) else (
        echo MISSING!   resourcepacks %ver%
        echo MISSING!   resourcepacks >> %mclog%
)

goto 1

:: Empties mods and config folder
:clear
echo.
set /p clear=Clear mods and config folder? (Y/N) : 
if /i "%clear%"=="Y" (
    for %%a in ("..\mods" "..\config" "..\resourcepacks") do (rd /S /Q "%%~a")
    timeout /T 2 /nobreak>nul
    md "..\mods" "..\config" "..\resourcepacks"
    echo [%date% %time%] Cleared mods, config and resourcepacks folder. >> %mclog%
    goto 1
)
if /i not "%clear%"=="N" (
    echo Input was neither Y nor N.
    goto clear
)

goto 1

:: Resets OptionSaverMC
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