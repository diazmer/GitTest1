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

::Set input Data
SET INPUTCDD="%inputDir%NEWCDD.cdd"

:: Set output Data
SET OUTPUTDEXT="%outputDir%TestDEXT.arxml"
SET LOGFILE="%outputDir%LogExportDEXT.log"

:: Set parameters and execute the Plugin
SET CMD=%CDS% /e dext /i %INPUTCDD% /o %OUTPUTDEXT% /g %LOGFILE%
%CMD%

echo  The Export DEXT was executed.

pause

endlocal




