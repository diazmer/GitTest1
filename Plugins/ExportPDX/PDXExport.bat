:: This windows 10 batch script executes a pdx export from CdS for a particular ECU variant.
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
SET INPUTVARIANT="Common_Diagnostics" 

:: Set output Data
SET OUTPUTPDX="%outputDir%Testpdx.pdx"
SET LOGFILE="%outputDir%LogPDXExport.log"

echo INPUTCDD = %INPUTCDD%
echo OUTPUTCDD = %OUTPUTCDD%

:: Set parameters and execute the Plugin
SET CMD=%CDS% /e odx220 /x pdx /i %INPUTCDD% /o %OUTPUTPDX% /g %LOGFILE%
%CMD%

echo  The PDX Export was executed.

pause

endlocal




