:: This windows 10 batch script executes the CdS Multi OEM Support Plugin with the given parameters below.
@echo off

setlocal
:: Set the input and output directory relative to the script location
SET "scriptDir=%~dp0"
SET "outputDir=%scriptDir%Output\"
SET "inputDir=%scriptDir%Input\"

:: Create the output directory if it doesn't exist
if not exist "%outputDir%" mkdir "%outputDir%"

::Set CdS + the Multi OEM Support Plugin
SET CDS="C:\Program Files\Vector CANdelaStudio 18\Bin\CANdelaStudio.exe"
SET PLUGIN="MultiOemSupportCmdLine"

::Read and get the Variants from Config.txt
set "configFile=Config.txt"

::Get target cdd from config file 
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "TargetCDD="') do (
    set "TargetCDDName=%%~a"
)

::Get the target variant from config file
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "TargetVariant="') do (
    set "TargetVariant=%%~a"
)

::Get source cdd from config file 
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "SourceCDD="') do (
    set "SourceCDDName=%%~a"
)

::Get the source variant from config file
for /f "tokens=2 delims==" %%a in ('type "%configFile%" ^| find "SourceVariant="') do (
    set "SourceVariant=%%~a"
)

::Set source data
SET SOURCECDD="%inputDir%%SourceCDDName%"
SET SOURCEVariant=%SourceVariant% 


:: The previous output CDD will be used as an input cdd for the current execution. 
:: Check if target cdd exists in Output folder. 
if exist %outputDir%%TargetCDD% (
    SET TARGETCDD="%outputDir%%TargetCDDName%"
) else (
    :: will be used only during first Plugin execution 	
    SET TARGETCDD="%inputDir%%TargetCDDName%"
)

SET TARGETVariant=%TargetVariant%

:: Set output Data
SET OUTPUTCDD="%outputDir%%TargetCDDName%"
SET LOGFILE="%outputDir%LogMultiOEMSupport.log"

:: Set Parameter and execute the Plugin
SET CMD=%CDS% /plugin %PLUGIN% /s %SOURCECDD% /sl %SOURCEVariant% /i %TARGETCDD% /il %TARGETVariant% /o %OUTPUTCDD% /g %LOGFILE% 
%CMD%

echo  The Multi OEM Support Plugin was executed.

pause

endlocal




