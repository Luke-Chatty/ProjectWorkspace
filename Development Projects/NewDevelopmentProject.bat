@echo off

title --- New Development Project Library ---

rem ##SetVariables##

set /p _contractname= Please Enter Name of Development Contract(LXXXX - Name of Contract):

set /p _securitygroup= Please Enter Name of Security Group (LXXXX): 

rem ##Copy Folder##

xcopy "\\seddonad.com\ProjectWorkspace\Development Projects\DevelopmentProjectTemplate" "\\seddonad.com\ProjectWorkspace\Development Projects\%_ContractName%" /O /X /E /H /K

rem ##Set Permissions Top Level##

icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%" /grant:r "seddonad\PWS - %_securitygroup%":r



rem ##Set Permissions 1. Site Particulars##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\1. Site Particulars" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\1. Site Particulars" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 2. Photographs##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\2. Photographs" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\2. Photographs" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 3. Financial Appraisals##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\3. Development Appraisals" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\3. Development Appraisals" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 4. Survey Reports##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\4. Survey Reports" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\4. Survey Reports" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 5. Planning##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\5. Planning" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\5. Planning" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 6. Client or JV Details##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\6. Client or JV Details" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\6. Client or JV Details" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 7. Employers Agent##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\7. Employers Agent" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\7. Employers Agent" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 8. Cost Plan##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\8. Cost Plan" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\8. Cost Plan" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 9. Programme##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\9. Programme" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\9. Programme" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 10. Working Drawings##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\1. Architects" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\1. Architects" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\2. Engineers" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\2. Engineers" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\3. Landscape" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\3. Landscape" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\4. Highways" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\4. Highways" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\5. Drainage" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\5. Drainage" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\6. Mech & Elec" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\10. Working Drawings\6. Mech & Elec" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 11.Meetings##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\11. Meetings" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\11. Meetings" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 12. Correspondence##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\12. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\12. Correspondence" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 13. Legal##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\13. Legal" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\13. Legal" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 14. Consultant Appointments##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\14. Consultant Appointments" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\14. Consultant Appointments" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 15. Building Regulation##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\15. Building Regulation" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\15. Building Regulation" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 16. Local Authority##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\16. Local Authority" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\16. Local Authority" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 17. Statutory Services##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\17. Statutory Services" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\17. Statutory Services" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 18. Clarifications##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\18. Clarifications" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\18. Clarifications" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 19. Bid Management##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\19. Bid Management" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\19. Bid Management" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 20. Final Bid##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\20. Final Bid" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\20. Final Bid" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


rem ##Set Permissions 21. Consultant Appointments##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\21. SHEQ" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\21. SHEQ" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 22. CVR##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\22. CVR" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Development Projects\%_ContractName%\22. CVR" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


pause
