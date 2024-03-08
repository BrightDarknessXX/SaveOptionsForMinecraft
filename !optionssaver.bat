@echo off
Title Option Saver v1.9 for Minecraft Java 

if not exist "OptionSaverMC" (md OptionSaverMC)
cd OptionSaverMC

set mcloglast=optionsmclast.log
set mclog=optionsmc.log

echo Option Saver for Minecraft Java [Version 1.9]
echo by _BrightDarkness_
Echo.
echo (Help for help page)

:1
echo.
set /p PV=
if /i "[%PV%]"=="[copy]" (goto copy)
if /i "[%PV%]"=="[copy /NBTONLY]" (goto copyNBTONLY)
if /i "[%PV%]"=="[paste]" (goto paste)
if /i "[%PV%]"=="[paste /NBTONLY]" (goto pasteNBTONLY)
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
echo COPY [/NBTONLY]
echo Saves options.
echo -NBTONLY  Only copies the .NBT file.
echo.
echo PASTE [/NBTONLY]
echo Loads options to use in Minecraft.
echo -NBTONLY  Only pastes the .NBT file.
echo.
echo LOG
echo Shows what you've pasted/copied in a log format.
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

REM Shows the log of what has been pasted or copied
:log
echo.
if exist "%mclog%" (
type %mclog%
) else (
Echo No log yet.
)

goto 1


REM Pastes the version you choose
:paste
echo.

echo Your profiles:
dir /b options*.txt
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=paste options for version:
echo [%date% %time%] Last pasted version: %ver% > %mcloglast%
echo [%date% %time%] Pasted %ver% >> %mclog%
echo.

if exist "options %ver%.txt" (
del ..\options.txt
copy "options %ver%.txt" "..\options.txt"
echo OK!   options %ver%.txt
echo OK!   options.txt >> %mclog%
echo OK!   options.txt >> %mcloglast%
) else (
echo MISSING!   options %ver%.tx
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
robocopy "config %ver%" "..\config" /S
echo OK!   config %ver%
echo OK!   config >> %mclog%
echo OK!   config >> %mcloglast%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %mclog%
echo MISSING!   config >> %mcloglast%
)

goto 1


REM Pastes the version you choose, but ONLY hotbar.nbt
:pasteNBTONLY
echo.

echo Your profiles:
dir /b hotbar*.nbt
echo.
if exist "%mcloglast%" (
type %mcloglast%
echo.
)

set /p ver=paste NBT for version:
echo [%date% %time%] Last pasted version: %ver% (NBTONLY) > %mcloglast%
echo [%date% %time%] Pasted %ver% (NBTONLY) >> %mclog%
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


REM Saves the version to be restored when needed
:copy
echo.

set /p ver=copy options as version:
echo [%date% %time%] Copied %ver% >> %mclog%
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
robocopy "..\config" "config %ver%" /S
echo OK!   config
echo OK!   config >> %mclog%
) else (
echo MISSING!   config
echo MISSING!   config >> %mclog%
)

goto 1


REM Copies the hotbar.nbt for the version given
:copyNBTONLY
echo.

set /p ver=copy NBT as version:
echo [%date% %time%] Copied %ver% (NBTONLY) >> %mclog%
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


REM Delete an entry
:clean
echo.
echo Type 'CLEAN' to reset OptionSaverMC.
echo.
set /p ver=Delete version:
if /i "[%ver%]"=="[CLEAN]" (goto reset)
echo [%date% %time%] Deleted %ver% >> %mclog%
echo.

if exist "options %ver%.txt" (
del "options %ver%.txt" /S /Q
echo OK!   options.txt >> %mclog%
) else (
echo MISSING!   options %ver%.txt
echo MISSING!   options.txt >> %mclog%
)

if exist "hotbar %ver%.nbt" (
del "hotbar %ver%.nbt" /S /Q
echo OK!   hotbar.nbt >> %mclog%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %mclog%
)

if exist "config %ver%" (
rd "config %ver%" /S /Q
echo OK!   config >> %mclog%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %mclog%
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
