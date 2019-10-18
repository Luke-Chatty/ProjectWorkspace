@echo off

title --- New Pre-Qualification Project Library ---

rem ##SetVariables##

set /p _contractname= Please Enter Name of Pre Qualification File(B16XXX - Name of Contract):

set /p _securitygroup= Please Enter Name of Security Group (B16XXX): 

rem ##Copy Folder##

xcopy "\\seddonad.com\ProjectWorkspace\Pre-Qualification Projects\PreQualTemplate" "\\seddonad.com\ProjectWorkspace\Pre-Qualification Projects\%_ContractName%" /O /X /E /H /K /I

rem ##Set Permissions Top Level##

icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%" /grant:r "seddonad\PWS - %_securitygroup%":r

rem ##Set Permissions 1.Client Information##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\1. Client Information" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\1. Client Information" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 2.Work In Progress##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\2. Work In Progress" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\2. Work In Progress" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\2. Work In Progress\Templates" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\2. Work In Progress\Templates" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t


rem ##Set Permissions 3. Quality Draft complete##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\3. Quality Draft complete" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\3. Quality Draft complete" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Set Permissions 4.PQQ Final Submission##
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\4. PQQ Final Submission" /grant:r "seddonad\PWS - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Pre-Qualification Projects\%_ContractName%\4. PQQ Final Submission" /grant:r "seddonad\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

pause
