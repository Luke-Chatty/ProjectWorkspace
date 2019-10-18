@echo off

title --- New Pre-Construction Project Library ---

rem ##SetVariables##

set /p _contractname= Please Enter Name of Pre Construction File(T16XXX - Name of Contract):

set /p _securitygroup= Please Enter Name of Security Group (T16XXX): 

rem ##Copy Folder##

xcopy "\\seddonad.com\ProjectWorkspace\Pre-Construction Projects\PreConTemplate" "\\seddonad.com\ProjectWorkspace\Pre-Construction Projects\%_ContractName%" /O /X /E /H /K

rem ##Set Permissions Top Level##

icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%" /grant:r "seddonad\PWS - %_securitygroup%":r

rem ##Set Permissions 1.Client Tender##
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.1 Con Docs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.2 Reports" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.3 Arch Dwgs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.4 Eng Dwgs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.5 M&E Dwgs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.6 Other Dwgs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.7 TA" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.8 Client Info" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.8 Client Info" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Pre-Construction Projects\%_ContractName%\1. Tender\1.9 Superceeded" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 2.BOQ##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\2. BoQ" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\2. BoQ" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 3. Supply Chain
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\3. Supply Chain" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\3. Supply Chain" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 4. Correspondence
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\4. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\4. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 5. Site Visit
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\5. Site Visit" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\5. Site Visit" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 6. QA Documents##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\6. QA Documents" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\6. QA Documents" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 7. Bid Submission##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\7. Bid Submission" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\7. Bid Submission" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 8. Bid Management##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\8. Bid Man Area" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\8. Bid Man Area" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 9. Estimating##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\9. Est Area" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\9. Est Area" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 10. Construction and Planning##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\10. Planning" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\10. Planning" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 11. Design##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\11. Design" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\11. Design" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 12. Final Submission##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\12. Final Submission" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\12. Final Submission" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 12. Final Submission##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\13. Post Tender" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\13. Post Tender" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 12. Final Submission##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\14. Handover" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Construction Projects\%_ContractName%\14. Handover" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
pause

