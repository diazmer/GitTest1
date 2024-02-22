:: This windows 10 batch script executes the Remove Trailing Blanks Plugin in CDD.
@echo off

setlocal
:: Set the input and output directory relative to the script location
SET "scriptDir=%~dp0"
SET "outputDir=%scriptDir%Output\"
SET "inputDir=%scriptDir%Input\"

:: Create the output directory if it doesn't exist
if not exist "%outputDir%" mkdir "%outputDir%"

::Set CdS + Mercedes-Benz: Remove trailing blanks Plugin 

SET CDS="C:\Program Files\Vector CANdelaStudio 18\Bin\CANdelaStudio.exe"
SET PLUGIN="Mercedes-Benz: Remove trailing blanks" 

::Set input Data
SET INPUTCDD="%inputDir%CTRLU_MBEAM_02.08.05.cdd" 

:: Set output Data
SET OUTPUTCDD="%outputDir%CTRLU_MBEAM_02.08.05_removed-blanks.cdd"
SET LOGFILE="%outputDir%RemoveTrailingBlanks.log"

echo INPUTCDD = %INPUTCDD%
echo OUTPUTCDD = %OUTPUTCDD%

:: Set parameters and execute the Plugin
SET CMD=%CDS% /i %INPUTCDD% /plugin %PLUGIN% /o %OUTPUTCDD% /g %LOGFILE%
%CMD%

echo  Remove Traling Blanks Plugin was executed.

pause

endlocal




