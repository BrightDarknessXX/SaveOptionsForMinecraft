@echo off
Title Option Saver v1.9 for Minecraft Java 

if not exist "OptionSaverMC" (md OptionSaverMC)
cd OptionSaverMC

set optm=optionsmc.txt
set optl=optionsmc.log

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
if /i "[%PV%]"=="[paste /SHADER]" (goto pasteSHADER)
if /i "[%PV%]"=="[log]" (goto log)
if /i "[%PV%]"=="[help]" (goto help)
if /i "[%PV%]"=="[clean]" (goto clean)
if /i "[%PV%]"=="[list]" (echo. & dir & echo. & goto 1)
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
echo PASTE [/NBTONLY] [/SHADER]
echo Loads options to use in Minecraft.
echo -NBTONLY  Only pastes the .NBT file.
echo -SHADER   Also pastes the shader options.
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
if exist "%optl%" (
type %optl%
) else (
Echo No log yet.
)

goto 1


REM Pastes the version you choose
:paste
echo.

if exist "%optm%" (
type %optm%
echo.
)

set /p ver=paste options for version:
echo [%date% %time%] Last pasted version: %ver% > %optm%
echo [%date% %time%] Pasted %ver% >> %optl%
echo.

if exist "options %ver%.txt" (
del ..\options.txt
copy "options %ver%.txt" "..\options.txt"
echo OK!   options %ver%.txt
echo OK!   options.txt >> %optl%
echo OK!   options.txt >> %optm%
) else (
echo MISSING!   options %ver%.tx
echo MISSING!   options.txt >> %optl%
echo MISSING!   options.txt >> %optm%
)

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
echo OK!   hotbar.nbt >> %optl%
echo OK!   hotbar.nbt >> %optm%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %optl%
echo MISSING!   hotbar.nbt >> %optm%
)

if exist "config %ver%" (
rd ..\config /S /Q
robocopy "config %ver%" "..\config" /S
echo OK!   config %ver%
echo OK!   config >> %optl%
echo OK!   config >> %optm%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %optl%
echo MISSING!   config >> %optm%
)

goto 1


REM Pastes the version you choose, but also optionsshaders.txt
:pasteSHADER
echo.

if exist "%optm%" (
type %optm%
echo.
)

set /p ver=paste options with shader included for version:
echo [%date% %time%] Last pasted version: %ver% (SHADER OPT INCL) > %optm%
echo [%date% %time%] Pasted %ver% (SHADER OPT INCL)>> %optl%
echo.

if exist "options %ver%.txt" (
del ..\options.txt
copy "options %ver%.txt" "..\options.txt"
echo OK!   options %ver%.txt
echo OK!   options.txt >> %optl%
echo OK!   options.txt >> %optm%
) else (
echo MISSING!   options %ver%.tx
echo MISSING!   options.txt >> %optl%
echo MISSING!   options.txt >> %optm%
)

if exist "optionsshaders %ver%.txt" (
del ..\optionsshaders.txt
copy "optionsshaders %ver%.txt" "..\optionsshaders.txt"
echo OK!   optionsshaders %ver%.txt
echo OK!   optionsshaders.txt >> %optl%
echo OK!   optionsshaders.tx >> %optm%
) else (
echo MISSING!   optionsshaders %ver%.txt
echo MISSING!   optionsshaders.txt >> %optl%
echo MISSING!   optionsshaders.txt >> %optm%
)

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
echo OK!   hotbar.nbt >> %optl%
echo OK!   hotbar.nbt >> %optm%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %optl%
echo MISSING!   hotbar.nbt >> %optm%
)

if exist "config %ver%" (
rd ..\config /S /Q
robocopy "config %ver%" "..\config" /S
echo OK!   config %ver%
echo OK!   config >> %optl%
echo OK!   config >> %optm%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %optl%
echo MISSING!   config >> %optm%
)

goto 1


REM Pastes the version you choose, but ONLY hotbar.nbt
:pasteNBTONLY
echo.

if exist "%optm%" (
type %optm%
echo.
)

set /p ver=paste NBT for version:
echo [%date% %time%] Last pasted version: %ver% (NBTONLY) > %optm%
echo [%date% %time%] Pasted %ver% (NBTONLY) >> %optl%
echo.

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
echo OK!   hotbar.nbt >> %optl%
echo OK!   hotbar.nbt >> %optm%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %optl%
echo MISSING!   hotbar.nbt >> %optm%
)

goto 1


REM Saves the version to be restored when needed
:copy
echo.

set /p ver=copy options as version:
echo [%date% %time%] Copied %ver% >> %optl%
echo.

if exist "..\options.txt" (
copy "..\options.txt" "options %ver%.txt"
echo OK!   options.txt
echo OK!   options.txt >> %optl%
) else (
echo MISSING!   options.txt
echo MISSING!   options.txt >> %optl%
)

if exist "..\optionsshaders.txt" (
copy "..\optionsshaders.txt" "optionsshaders %ver%.txt"
echo OK!   optionsshaders.txt
echo OK!   optionsshaders.txt >> %optl%
) else (
echo MISSING!   optionsshaders.txt
echo MISSING!   optionsshaders.txt >> %optl%
)

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
echo OK!   hotbar.nbt >> %optl%
) else (
echo MISSING!   hotbar.nbt
echo MISSING!   hotbar.nbt >> %optl%
)

if exist "..\config" (
robocopy "..\config" "config %ver%" /S
echo OK!   config
echo OK!   config >> %optl%
) else (
echo MISSING!   config
echo MISSING!   config >> %optl%
)

goto 1


REM Copies the hotbar.nbt for the version given
:copyNBTONLY
echo.

set /p ver=copy NBT as version:
echo [%date% %time%] Copied %ver% (NBTONLY) >> %optl%
echo.

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
echo OK!   hotbar.nbt >> %optl%
) else (
echo MISSING!   hotbar.nbt
echo MISSING!   hotbar.nbt >> %optl%
)

goto 1


REM Delete an entry
:clean
echo.
echo Type 'CLEAN' to reset OptionSaverMC.
echo.
set /p ver=Delete version:
if /i "[%ver%]"=="[CLEAN]" (goto reset)
echo [%date% %time%] Deleted %ver% >> %optl%
echo.

if exist "options %ver%.txt" (
del "options %ver%.txt" /S /Q
echo OK!   options.txt >> %optl%
) else (
echo MISSING!   options %ver%.txt
echo MISSING!   options.txt >> %optl%
)

if exist "optionsshaders %ver%.txt" (
del "optionsshaders %ver%.txt" /S /Q
echo OK!   optionsshaders.txt >> %optl%
) else (
echo MISSING!   optionsshaders %ver%.txt
echo MISSING!   optionsshaders.txt >> %optl%
)

if exist "hotbar %ver%.nbt" (
del "hotbar %ver%.nbt" /S /Q
echo OK!   hotbar.nbt >> %optl%
) else (
echo MISSING!   hotbar %ver%.nbt
echo MISSING!   hotbar.nbt >> %optl%
)

if exist "config %ver%" (
rd "config %ver%" /S /Q
echo OK!   config >> %optl%
) else (
echo MISSING!   config %ver%
echo MISSING!   config >> %optl%
)

goto 1

REM Resets OptionSaverMC
:reset
echo.
dir
echo.
:resetERR
set /p ver=Are you sure you want to delete all files listed above? (Y/N) : 
if /i "[%ver%]"=="[Y]" (
    cd ..
    rd OptionSaverMC /S /Q
    exit
)
if /i "[%ver%]"=="[N]" (goto 1) else (goto resetERR)
