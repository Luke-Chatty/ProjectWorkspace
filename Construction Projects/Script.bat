@echo off

title --- New Construction Project Library ---

set /p _contractname= Please Enter Name of Construction Project Library(SOXXX - Name of Contract):

set /p _securitygroup= Please Enter REF ID of Security Group (E.G S0636):

 
timeout /t 2

echo Setting PWS - %_securitygroup% Permissions

rem ##Copy Folder##

xcopy "\\seddonad.com\ProjectWorkspace\Construction Projects\ContractTemplate" "\\seddonad.com\ProjectWorkspace\Construction Projects\%_ContractName%" /O /E /H /K

rem ##Permissions for Top Level (Legal Team)##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%" /grant:r "SEDDONAD\PWS - %_securitygroup%:r

rem ##Permissions for 1.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\PWS - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t

rem ##Permissions for 2.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.1 Design Team Drawings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.2 Schedules" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.3 Specification" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.4 Data Sheets (Room-area)" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.5 Design Images - Sketches (WIP)" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.6 Design Team Meetings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.7 Reports" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.8 Calculations" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.9 Architect Models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.10 Structural models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.11 M&E Models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.12 Federated Models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.13 Naviswork models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.14 Sub contractors models" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.15 Sub contractors design drawings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.16 Contractor Construction Issue" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.17 Issue Sheets (Drawing Registers)" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 3.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.0 Project Mobilsation" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.1 Decision to Proceed Meeting" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.2 Profit Plan" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.3 Site Set Up" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 4.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.1 Employers" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.2 Employers Agent" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.3 Architect" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.4 Structure" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.5 M&E" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.6 Misc Design Team" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.7 Utility" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.8 Sub-Contractor" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.9 PQS" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 5.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.1 Project Team Meetings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.2 Client Meeting and Contractor Reports" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.3 Project Management Plan" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.4 Inspection and Test  Plan" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.5 Sub Contract Meetings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.6 Site Diary" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.7 Service Connections and Utilities" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.8 Material and Plant" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.9 MCR" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.10 Information Required Schedule" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.11 RFI-SVI Schedule" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.12 Procurement Schedule" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.13 Planning Permissions and Building Regs" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.14 Construction Programme" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.15 Delivery Programme" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.16 Misc Programme" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.17 Progressed Programme" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.18 Planning Progress Reports" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.19 Resident Liaison" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.20 Site Photos" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.21 Inspection records" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.22 Trackers" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.23 A-Site BIM Protocols" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.24 Setting Out and Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.25 Section Agreements" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.26 Social Value" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 6.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.1 Construction Phase Plan" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.2 Method Statements and Risk Assessments" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.3 COSHH Assessments" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.4 Waste Management" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.5 Aspects and Impact Register" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.6 Monthly Returns" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.7 Sustainability Reports" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.8 Toolbox Talks" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.9 Audits" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.10 Non Conformance Reports" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.11 Near Misses" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.12 Test Certificates" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.13 Third Party Inspections" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.14 Permits to Work" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.15 Asbestos" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.16 Temporary Works" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


rem ##Permissions for 7.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.1 CVR" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.2 Externals Valuations" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.3 Contractor Trade Library Index" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.4 Sub contract or Consultant enquiries" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.5 Sub contract or Consultant Orders" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.6 Warranties Bonds etc" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.7 Sub contract or Consultant Payment Applications" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.8 Sub contract or Consultant Payment Notices" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.9 Sub contract or Consultant Performance Review" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.10 Sub contract or Consultant Claims or Disputes" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.11 Seddon Direct Work" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.12 Materials" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.13 Plant" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.14 Preliminaries" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.15 Measurement" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.16 Utilities and Statutory Bodies" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.17 Authorities" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.18 Cheque Requisitions" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.19 Contractual Notices" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.20 Variation Pricing" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.21 EOTDelaysClaims" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.22 Value Engineering - Optioneering" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.23 QS Photos - Records" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.24 Insurances" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.25 Liquidations or Administrations" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 8.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.1 O&M" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.2 Customer Care" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.3 As Built Drawings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.4 Defect Management" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.5 Handover Schedule" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.6 12 Month Defect List" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.7 Client Training" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 9.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering" /grant:r "SEDDONAD\pws - %_securitygroup%":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.1 CAD As Built Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.2 CAD Supplied Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.3 CAD Rotated Design Drawings" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.4 Cad Site Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.5 Modelling As Built Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.6 Modelling Supplied Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.7 Modelling Site Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.8 Modelling Volume Calcs" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.9 Pdf As Built Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.10 Pdf Supplied Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.11 Pdf Site Surveys" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.12 Pdf Volume Calcs" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.13 Site Control" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.14 Design Queries" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.15 Setting Out" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.16 Tw Prep" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.17 Raw Data" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.18 Workings Area" /grant:r "SEDDONAD\pws - %_securitygroup%":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

Echo Setting Legal Team Permissions

timeout /t 2

rem ##Permissions for Top Level (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%" /grant:r "SEDDONAD\PWS - Legal Team:r

rem ##Permissions for 1.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\PWS - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t

rem ##Permissions for 2.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.1 Design Team Drawings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.2 Schedules" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.3 Specification" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.4 Data Sheets (Room-area)" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.5 Design Images - Sketches (WIP)" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.6 Design Team Meetings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.7 Reports" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.8 Calculations" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.9 Architect Models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.10 Structural models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.11 M&E Models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.12 Federated Models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.13 Naviswork models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.14 Sub contractors models" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.15 Sub contractors design drawings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.16 Contractor Construction Issue" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.17 Issue Sheets (Drawing Registers)" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 3.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.0 Project Mobilsation" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.1 Decision to Proceed meeting" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.2 Profit Plan" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.3 Site Set Up" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 4.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.1 Employers" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.2 Employers Agent" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.3 Architect" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.4 Structure" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.5 M&E" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.6 Misc Design Team" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.7 Utility" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.8 Sub-Contractor" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.9 PQS" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 5.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.1 Project Team Meetings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.2 Client Meeting and Contractor Reports" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.3 Project Management Plan" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.4 Inspection and Test  Plan" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.5 Sub Contract Meetings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.6 Site Diary" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.7 Service Connections and Utilities" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.8 Material and Plant" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.9 MCR" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.10 Information Required Schedule" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.11 RFI-SVI Schedule" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.12 Procurement Schedule" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.13 Planning Permissions and Building Regs" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.14 Construction Programme" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.15 Delivery Programme" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.16 Misc Programme" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.17 Progressed Programme" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.18 Planning Progress Reports" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.19 Resident Liaison" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.20 Site Photos" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.21 Inspection records" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.22 Trackers" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.23 A-Site BIM Protocols" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.24 Setting Out and Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.25 Section Agreements" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.26 Social Value" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 6.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.1 Construction Phase Plan" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.2 Method Statements and Risk Assessments" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.3 COSHH Assessments" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.4 Waste Management" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.5 Aspects and Impact Register" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.6 Monthly Returns" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.7 Sustainability Reports" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.8 Toolbox Talks" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.9 Audits" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.10 Non Conformance Reports" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.11 Near Misses" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.12 Test Certificates" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.13 Third Party Inspections" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.14 Permits to Work" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.15 Asbestos" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.16 Temporary Works" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


rem ##Permissions for 7.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.1 CVR" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.2 Externals Valuations" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.3 Contractor Trade Library Index" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.4 Sub contract or Consultant enquiries" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.5 Sub contract or Consultant Orders" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.6 Warranties Bonds etc" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.7 Sub contract or Consultant Payment Applications" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.8 Sub contract or Consultant Payment Notices" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.9 Sub contract or Consultant Performance Review" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.10 Sub contract or Consultant Claims or Disputes" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.11 Seddon Direct Work" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.12 Materials" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.13 Plant" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.14 Preliminaries" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.15 Measurement" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.16 Utilities and Statutory Bodies" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.17 Authorities" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.18 Cheque Requisitions" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.19 Contractual Notices" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.20 Variation Pricing" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.21 EOTDelaysClaims" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.22 Value Engineering - Optioneering" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.23 QS Photos - Records" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.24 Insurances" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.25 Liquidations or Administrations" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 8.0 (Legal Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.1 O&M" /grant:r "SEDDONAD\pws - Legal Team":(OI)(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.2 Customer Care" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.3 As Built Drawings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.4 Defect Management" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.5 Handover Schedule" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.6 12 Month Defect List" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.7 Client Training" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 9.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering" /grant:r "SEDDONAD\pws - Legal Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.1 CAD As Built Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.2 CAD Supplied Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.3 CAD Rotated Design Drawings" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.4 Cad Site Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.5 Modelling As Built Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.6 Modelling Supplied Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.7 Modelling Site Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.8 Modelling Volume Calcs" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.9 Pdf As Built Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.10 Pdf Supplied Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.11 Pdf Site Surveys" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.12 Pdf Volume Calcs" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.13 Site Control" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.14 Design Queries" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.15 Setting Out" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.16 Tw Prep" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.17 Raw Data" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.18 Workings Area" /grant:r "SEDDONAD\pws - Legal Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

Echo Legal Team Permissions Set

timeout /t 2

Echo Setting SHEQ Team Permissions

rem ##Permissions for Top Level (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%" /grant:r "SEDDONAD\PWS - SHEQ Team":r

rem ##Permissions for 1.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\PWS - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\1.0 Contract Documents" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t

rem ##Permissions for 2.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.1 Design Team Drawings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.2 Schedules" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.3 Specification" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.4 Data Sheets (Room-area)" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.5 Design Images - Sketches (WIP)" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.6 Design Team Meetings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.7 Reports" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.8 Calculations" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.9 Architect Models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.10 Structural models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.11 M&E Models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.12 Federated Models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.13 Naviswork models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.14 Sub contractors models" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.15 Sub contractors design drawings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.16 Contractor Construction Issue" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\2.0 Design-A-Site Folder\2.17 Issue Sheets (Drawing Registers)" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 3.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.0 Project Mobilsation" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.1 Decision to Proceed meeting" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.2 Profit Plan" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\3.3 Site Set Up" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 4.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.1 Employers" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.2 Employers Agent" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.3 Architect" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.4 Structure" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.5 M&E" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.6 Misc Design Team" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.7 Utility" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.8 Sub-Contractor" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\4.0 Correspondence\4.9 PQS" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 5.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.1 Project Team Meetings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.2 Client Meeting and Contractor Reports" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.3 Project Management Plan" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.4 Inspection and Test  Plan" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.5 Sub Contract Meetings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.6 Site Diary" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.7 Service Connections and Utilities" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.8 Material and Plant" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.9 MCR" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.10 Information Required Schedule" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.11 RFI-SVI Schedule" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.12 Procurement Schedule" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.13 Planning Permissions and Building Regs" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.14 Construction Programme" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.15 Delivery Programme" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.16 Misc Programme" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.17 Progressed Programme" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.18 Planning Progress Reports" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.19 Resident Liaison" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.20 Site Photos" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.21 Inspection records" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.22 Trackers" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.23 A-Site BIM Protocols" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.24 Setting Out and Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.25 Section Agreements" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\5.0 Project Delivery\5.26 Social Value" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 6.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.1 Construction Phase Plan" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.2 Method Statements and Risk Assessments" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.3 COSHH Assessments" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.4 Waste Management" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.5 Aspects and Impact Register" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.6 Monthly Returns" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.7 Sustainability Reports" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.8 Toolbox Talks" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.9 Audits" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.10 Non Conformance Reports" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.11 Near Misses" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.12 Test Certificates" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.13 Third Party Inspections" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.14 Permits to Work" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.15 Asbestos" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\6.0 SHEQ\6.16 Temporary Works" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


rem ##Permissions for 7.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.1 CVR" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.2 Externals Valuations" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.3 Contractor Trade Library Index" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.4 Sub contract or Consultant enquiries" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.5 Sub contract or Consultant Orders" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.6 Warranties Bonds etc" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.7 Sub contract or Consultant Payment Applications" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.8 Sub contract or Consultant Payment Notices" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.9 Sub contract or Consultant Performance Review" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.10 Sub contract or Consultant Claims or Disputes" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.11 Seddon Direct Work" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.12 Materials" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.13 Plant" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.14 Preliminaries" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.15 Measurement" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.16 Utilities and Statutory Bodies" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.17 Authorities" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.18 Cheque Requisitions" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.19 Contractual Notices" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.20 Variation Pricing" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.21 EOTDelaysClaims" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.22 Value Engineering - Optioneering" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.23 QS Photos - Records" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.24 Insurances" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\7.0 Commercial\7.25 Liquidations or Administrations" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 8.0 (SHEQ Team) ##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.1 O&M" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(CI)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.2 Customer Care" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.3 As Built Drawings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.4 Defect Management" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.5 Handover Schedule" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.6 12 Month Defect List" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\8.0 Handover and Aftercare\8.7 Client Training" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

rem ##Permissions for 9.0##
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering" /grant:r "SEDDONAD\pws - SHEQ Team":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.1 CAD As Built Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.2 CAD Supplied Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.3 CAD Rotated Design Drawings" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.4 Cad Site Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.5 Modelling As Built Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.6 Modelling Supplied Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.7 Modelling Site Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.8 Modelling Volume Calcs" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.9 Pdf As Built Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.10 Pdf Supplied Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.11 Pdf Site Surveys" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.12 Pdf Volume Calcs" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.13 Site Control" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.14 Design Queries" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.15 Setting Out" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.16 Tw Prep" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.17 Raw Data" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t
icacls "\\seddonad.com\projectworkspace\Construction Projects\%_ContractName%\9.0 Engineering\9.18 Workings Area" /grant:r "SEDDONAD\pws - SHEQ Team":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t

Pause

Echo SHEQ Permissions Set
Echo Script Completed
