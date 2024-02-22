:: This windows 10 batch script executes a DEXT export from a given CDD.
@echo off

setlocal
:: Set the input and output directory relative to the script location
SET "scriptDir=%~dp0"
SET "outputDir=%scriptDir%Output\"
SET "inputDir=%scriptDir%Input\"

:: Create the output directory if it doesn't exist
if not exist "%outputDir%" mkdir "%outputDir%"

::Set CdS 
SET CDS="C:\Program Files\Vector CANdelaStudio 18\Bin\CANdelaStudio.exe"

::Set Config.txt
set "configFile=Config.txt"

::Get target cdd from config file 
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "InputCDD="') do (
    set "InputCDDName=%%~a"
)

::Set input Data
SET INPUTCDD="%inputDir%%InputCDDName%"

::Remove ".cdd" from the InputCDDName
Set modifiedCDDName=%InputCDDName:.cdd=%

:: Set output Data. Output for DEXT and log are the same as the input CDD Name
SET OUTPUTDEXT="%outputDir%%modifiedCDDName%.arxml"
SET LOGFILE="%outputDir%%modifiedCDDName%.log"

:: Set parameters and execute the Plugin
SET CMD=%CDS% /e dext /i %INPUTCDD% /o %OUTPUTDEXT% /g %LOGFILE%
%CMD%

echo  The Export DEXT was executed.

endlocal




