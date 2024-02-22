:: This will sequencially call the batch files for Step 4 of Pipeline1(Automate CDD Generation per Single Variant)
@echo off

::delete the existing file
if exist "Step4LogFile.txt" (
    del "Step4LogFile.txt"
)

::Log the result of each .bat execution in a Step4LogFile.txt  
set "Step4LogFile=Step4LogFile.txt"
echo Step 4 Result Summary > %Step4LogFile%
echo. >> "%Step4LogFile%"

:: Call batch script to Export PDX
call ExportPDX.bat
echo ExportPDX execution result %ERRORLEVEL%
echo ExportPDX execution result %ERRORLEVEL% >> %Step4LogFile%

:: Call batch script to Export DEXT
call ExportDEXT.bat
echo ExportDEXT execution result %ERRORLEVEL%
echo ExportDEXT execution result %ERRORLEVEL%  >> %Step4LogFile%

:: Call batch script to Export ACL
call ExportACL.bat
echo Export ACL execution result %ERRORLEVEL%
echo Export ACL execution result %ERRORLEVEL%  >> %Step4LogFile%


echo end call Diagpipeline1 Step 4.

pause

