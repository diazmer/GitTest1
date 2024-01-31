@echo off
SET CDS="C:\Program Files\Vector CANdelaStudio 18\Bin\CANdelaStudio.exe"
SET PLUGIN="MultiOemSupportCmdLine"
SET SOURCECDD="C:\Temp\Multi OEM-Support\SupplierCDDTest2.cdd"
SET SOURCEVariant="VariantTest1" 
SET TARGETCDD="C:\Temp\Multi OEM-Support\LCP_P23.cdd"
SET TARGETVariant="LCP_001"
SET OUTPUTCDD="C:\Temp\Multi OEM-Support\LCP_P23_merged.cdd"
SET LOGFILE= "C:\Temp\Multi OEM-Support\LogMultiOEMSupport.log"
SET CMD=%CDS% /plugin %PLUGIN% /s %SOURCECDD% /sl %SOURCEVariant% /i %TARGETCDD% /il %TARGETVariant% /o %OUTPUTCDD% /g %LOGFILE% /deactServices /warnOnInstanceUpdates
%CMD%





