#Elevate


#if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
   

#Introduction
Import-module activedirectory
Write-Host Please follow Instructions to configure the Engineering Services Tenders -ForegroundColor Green

#InitialVariables
Write-Host "Please Enter PWS Folder Name (e.g Job Name)" -ForegroundColor Cyan -NoNewline
$PWSName = Read-Host
Write-Host "Please Enter PWS Contract ID (e.g EST19XXX)" -ForegroundColor Cyan -NoNewline
$PWSID = Read-Host

#CreateSecurityGroups
Write-Host Creating Associated Security Groups -ForegroundColor Green

New-ADGroup -Name "PWS-$PWSID" -GroupCategory Security -GroupScope Global -Path "OU=PWS - Engineering Services Tenders,OU=Project WorkSpace,OU=Security Groups,DC=seddonad,DC=com"

Write-Host Copying Template and Creating New Folder -ForegroundColor Green

#PerissionVariables
$SG = "SEDDONAD\PWS - $PWSID"
$CDest = "\\seddonad.com\ProjectWorkspace\Engineering Services Tenders\$PWSID $PWSName"
$CSource = "\\seddonad.com\ProjectWorkspace\Engineering Services Tenders\EngineeringServicesTemplate"

#Create New Folder from Template
robocopy "$CSource" "$CDest" /COPY:DAS /E /NFL /NDL /NJH /NJS

#iCACLS Variables
$strGrant = "/grant"

$strIcaclsPrms1 = ":(CI)(R,X,RD,RA,REA,WA,WEA)" #Top Level Folder Permisions
$strIcaclsPrms2 = ":(OI)(CI)(R,X,RD,RA,REA,WD,WA,WEA,AD,D)" #Folder Level Permissions
$strIcaclsPrms3 = ":(OI)(IO)(R,X,RD,RA,REA,WD,WA,WEA,AD,D)" #File Level Permission

$strIcaclsDefaultPath = "\\seddonad.com\projectworkspace\Engineering Services Tenders\$PWSID $PWSName"

Write-Host Setting Top Level Permissions -ForegroundColor Green

#Top Level Permissions
Invoke-Expression -Command ('icacls $strIcaclsDefaultPath $strGrant "$SG$strIcaclsPrms1"')

##Setting Level 1 Permissions
Write-Host Setting Permissions -ForegroundColor Green

#File Permissions 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\1. Prelim Book" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\1. Prelim Book" $strGrant "$SG$strIcaclsPrms3" /t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\2. Mechanical Cost" $strGrant "$SG$strIcaclsPrms1"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\3. Electrical Cost" $strGrant "$SG$strIcaclsPrms1"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2. Tender Launch" $strGrant "$SG$strIcaclsPrms1" /t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\0. File Set Up" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\2. Drawings" $strGrant "$SG$strIcaclsPrms1"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\5. Quotations" $strGrant "$SG$strIcaclsPrms1"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms1"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\9. Suppliers" $strGrant "$SG$strIcaclsPrms2"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\0. Folder Set Up" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\1. Drawings" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms2"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Accessories" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Cables" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Containment" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Data" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Distribution" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Door Access" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\External Lighting" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Fire Aalrm" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Generator" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Lightign Controls" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Lighting" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Lightning Protection" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Nurse Call" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Security" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Sub Mains" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\Television" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\5. Quotations\UPS" $strGrant "$SG$strIcaclsPrms2"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms2"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms1"/t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\9. Suppliers" $strGrant "$SG$strIcaclsPrms2"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5. Tender Return Letter" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6. Hand Over" $strGrant "$SG$strIcaclsPrms1" /t')


Write-Host Script Completed -ForegroundColor Green
Write-Host Script Completed -ForegroundColor Green
Write-Host Script Completed -ForegroundColor Green
