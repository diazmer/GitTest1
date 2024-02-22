:: This windows 10 batch script executes the CdS ACL Exporter Plugin for a particular ECU Variant and overwrite the previuos result
@echo off

setlocal
:: Set the input and output directory relative to the script location
SET "scriptDir=%~dp0"
SET "outputDir=%scriptDir%Output\"
SET "inputDir=%scriptDir%Input\"

:: Create the output directory if it doesn't exist
if not exist "%outputDir%" mkdir "%outputDir%"

::Set Access Rights Exporter App 
SET CDS="C:\Program Files\Vector CANdelaStudio 18\Bin\AccessRightsExporterApp.exe "

::Read and get the target variant from Config.txt
set "configFile=Config.txt"

::Search for input Variant
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "InputVariant="') do (
    set "InputVariant=%%~a"
)

:: The previous output CDD will be used as an input cdd for the current execution. 
:: Check if cdd exists in Output folder. 
if exist %outputDir%CTRLU_MBEAM_02.08.05.cdd (
   SET INPUTCDD="%outputDir%CTRLU_MBEAM_02.08.05.cdd"   
) else (
    :: will be used only during first Plugin execution 	
    SET INPUTCDD="%inputDir%CTRLU_MBEAM_02.08.05.cdd"
)

SET TARGETVariant=%TargetVariant%

:: Set output Data
SET OUTPUT=%outputDir%
SET LOGFILE="%outputDir%LogACL.log"

:: Set Parameter and execute the Plugin
SET CMD=%CDS% -i %INPUTCDD% -s %InputVariant% -d %OUTPUT% -l %LOGFILE% -f
%CMD%

echo  The ACL Exporter Plugin was executed.

endlocal




