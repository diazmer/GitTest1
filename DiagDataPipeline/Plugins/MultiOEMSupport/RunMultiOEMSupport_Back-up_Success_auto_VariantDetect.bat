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
set "filename=Config.txt"

::Search for Target Variant
for /f "tokens=2 delims==" %%a in ('type "%filename%" ^| find "TargetVariant="') do (
    set "TargetVariant=%%~a"
)

::Search for Source Variant
for /f "tokens=2 delims==" %%a in ('type "%filename%" ^| find "SourceVariant="') do (
    set "SourceVariant=%%~a"
)

::Set input Data
SET SOURCECDD="%inputDir%BasisCDD3.cdd"
SET SOURCEVariant=%SourceVariant% 

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
SET OUTPUTCDD="%outputDir%NewCDD.cdd"
SET LOGFILE="%outputDir%LogMultiOEMSupport.log"

:: Set Parameter and execute the Plugin
SET CMD=%CDS% /plugin %PLUGIN% /s %SOURCECDD% /sl %SOURCEVariant% /i %TARGETCDD% /il %TARGETVariant% /o %OUTPUTCDD% /g %LOGFILE% 
%CMD%


echo  The Multi OEM Support Plugin was executed.

endlocal




