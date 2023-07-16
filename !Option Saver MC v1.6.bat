@echo off
Title Option Saver for Minecraft Java v1.6

if not exist "OptionSaverMC" (md OptionSaverMC)
cd OptionSaverMC

set optm=optionsmc.txt
set optl=optionsmc.log

echo Option Saver for Minecraft Java [Version 1.6]
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
if /i "[%PV%]"=="[x]" (exit)

echo.
echo %PV% is no option.
goto 1

#
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
echo HELP
echo Shows this help page.
echo.
echo X
echo Exits the program.

goto 1

#

:log
echo.
if exist "%optl%" (
type %optl%
) else (
Echo No log yet.
)

goto 1

#

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
) else (
echo MISSING!   options %ver%.tx
)

if exist "optionsof %ver%.txt" (
del ..\optionsof.txt
copy "optionsof %ver%.txt" "..\optionsof.txt"
echo OK!   optionsof %ver%.txt
) else (
echo MISSING!   optionsof %ver%.txt
)

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
) else (
echo MISSING!   hotbar %ver%.nbt
)

goto 1

#

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
) else (
echo MISSING!   options %ver%.tx
)

if exist "optionsof %ver%.txt" (
del ..\optionsof.txt
copy "optionsof %ver%.txt" "..\optionsof.txt"
echo OK!   optionsof %ver%.txt
) else (
echo MISSING!   optionsof %ver%.txt
)

if exist "optionsshaders %ver%.txt" (
del ..\optionsshaders.txt
copy "optionsshaders %ver%.txt" "..\optionsshaders.txt"
echo OK!   optionsshaders %ver%.txt
) else (
echo MISSING!   optionsshaders %ver%.txt
)

if exist "hotbar %ver%.nbt" (
del ..\hotbar.nbt
copy "hotbar %ver%.nbt" "..\hotbar.nbt"
echo OK!   hotbar %ver%.nbt
) else (
echo MISSING!   hotbar %ver%.nbt
)

goto 1

#

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
) else (
echo MISSING!   hotbar %ver%.nbt
)

goto 1

#

:copy
echo.

set /p ver=copy options as version:
echo [%date% %time%] Copied %ver% >> %optl%
echo.

if exist "..\options.txt" (
copy "..\options.txt" "options %ver%.txt"
echo OK!   options.txt
) else (
echo MISSING!   options.txt
)

if exist "..\optionsof.txt" (
copy "..\optionsof.txt" "optionsof %ver%.txt"
echo OK!   optionsof.txt
) else (
echo MISSING!   optionsof.txt
)

if exist "..\optionsshaders.txt" (
copy "..\optionsshaders.txt" "optionsshaders %ver%.txt"
echo OK!   optionsshaders.txt
) else (
echo MISSING!   optionsshaders.txt
)

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
) else (
echo MISSING!   hotbar.nbt
)

goto 1

#

:copyNBTONLY
echo.

set /p ver=copy NBT as version:
echo [%date% %time%] Copied %ver% (NBTONLY) >> %optl%
echo.

if exist "..\hotbar.nbt" (
copy "..\hotbar.nbt" "hotbar %ver%.nbt"
echo OK!   hotbar.nbt
) else (
echo MISSING!   hotbar.nbt
)

goto 1

#
