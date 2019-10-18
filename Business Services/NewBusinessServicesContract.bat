@echo off

title --- New Business Services Project Library ---

rem ##SetVariables##

set /p _contractname= Please Enter Name of Business Services Contract(D0XXXMECH - Name of Contract):

set /p _securitygroup= Please Enter Name of Security Group (D0XXXMECH/PAIN ETC): 

rem ##Copy Folder##

xcopy "\\seddonad.com\ProjectWorkspace\Business Services\BusinessServicesTemplate" "\\seddonad.com\ProjectWorkspace\Business Services\%_ContractName%" /O /X /E /H /K

rem ##Set Permissions Top Level##

icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%" /grant:r "seddonad\PWS - %_securitygroup%":r

rem ##Set Permissions 1. Tender Information (EST)##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\1. Tender Information (EST)" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 2. Work In Progress##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\2. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\2. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 3. Photographs##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\3. Photographs" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\3. Photographs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 4. Materials##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\4. Materials" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\4. Materials" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 5. Plant##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\5. Plant" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\5. Plant" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 6. Programme##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\6. Programme" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\6. Programme" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 7. Health & Safety & RAMS##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\7. Health & Safety & RAMS" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\7. Health & Safety & RAMS" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 8. Commercial Quote Information##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\8. Commercial Quote Information" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\8. Commercial Quote Information" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 9. Commercial Contract Order Information##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\9. Commercial Contract Order Information" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\9. Commercial Contract Order Information" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 10. Commercial Valuation Information & Final Account##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\10. Commercial Valuation Information & Final Account" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\10. Commercial Valuation Information & Final Account" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 11. Quality Control##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\11. Quality Control" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\11. Quality Control" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 12. Subcontractors##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\12. Subcontractors" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\12. Subcontractors" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 13. Design Info##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\13. Design Info" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\13. Design Info" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 14. Quote Information##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\14. Quote Information" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Business Services\%_ContractName%\14. Quote Information" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

pause
