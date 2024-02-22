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
set "filename=Config.txt"

::Search for target Variant
for /f "tokens=2 delims==" %%a in ('type "%filename%" ^| find "TargetVariant="') do (
    set "TargetVariant=%%~a"
)

:: The previous output CDD will be used as an input cdd for the current execution. 
:: Check if NewCDD.cdd exists in Output folder. 
if exist %outputDir%NewCDD.cdd (
   SET TARGETCDD="%outputDir%NewCDD.cdd"   
) else (
    :: will be used only during first Plugin execution 	
    SET TARGETCDD="%inputDir%NewCDD.cdd"
)

SET TARGETVariant=%TargetVariant%

:: Set output Data
SET OUTPUTCDD=%outputDir%
SET LOGFILE="%outputDir%LogACL.log"

:: Set Parameter and execute the Plugin
SET CMD=%CDS% -i %TARGETCDD% -s %TARGETVariant% -d %OUTPUTCDD% -l %LOGFILE% -f
%CMD%

echo  The Multi OEM Support Plugin was executed.

endlocal




