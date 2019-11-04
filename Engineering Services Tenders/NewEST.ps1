<#
.Synopsis
   PWS Script for Construction Projects
.DESCRIPTION
   This script will capture user input, create an AD group in the correct OU, take a copy of the folder structure template and apply correct permissions of newly created AD group using iCACLs.
.NOTES
  Version:        1.2
  Author:         Luke Chatburn
  Creation Date:  29/10/19
  Purpose/Change: 
Modified all anchors to allow for different resolutions. Size is no-longer fixed and if the default window is warped user can resize accordingly.
Fixed clipping issue with Construction project label.
Fixed permission issue where users could save outside folder structure despite not being able to see what they save.
Set default state of checkbox to checked, 90% of the time an AD group will be created. (previously unchecked)

#>


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$WinForm                         = New-Object system.Windows.Forms.Form
$WinForm.ClientSize              = '410,350'
$WinForm.text                    = "PWS - New Engineering Services Tenders"
$WinForm.TopMost                 = $false
$WinForm.BackColor               = "#f7fcff"


#Icon
$iconBase64                      = 'iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAABmJLR0QA/wD/AP+gvaeTAAADGklEQVRYhe2Yy08TURSHf9OZPqalBQt9CK3YUhrFhQgxVRZGJArC1rBwIyshcWHiK/YfMGAIibuya2LiwrAwURdlURKMaKMmuikJLSVSEFug0jZ2aDvtuKEFKsqUMmXTbzVzc0/myznn3rm5QIUKRwsBAN3DHzi+AWJSNPbmoe2+cEq7oXIPd2/Y9p3MJNN4OeUd7Bv1EG8f2O4JaraFqJjJtFSM/s4WRZVMcrtv1DMmlNRO8iXmk8Ecv2IJTEzPZhKbLCmYGQDX44sEtf+03fiW1jH99TvazGqyv6MREqqoIvBmyOEBsKMHn014eAXqamjcuW6FSVcliFgheUHHEP8SlxNh6nOIVARLpSJYKhXBUqkIlkpFsFSKPs2UgjcYxaf5COZ+xBFLJAEA1QoprHolzjercdpQfTSCoQ0GzqkFRJkMDHoNWs/oIJdJAQCJzSRW12N4Pr2IGjmFgcsmaGtk5RP0rcQw7vLDYmpAa71264i8jUpBQ6WgYT6hxcJSGCOvvBjqtpRHMLTBwOHy41yLBRq18r9zCRAwG3RQymk4XP78uKCLxDm1gGZTw55yg+0iDLb//XmNWgVLYz0okhRWcHYpiiiTwckGTdGxJqMWEjGJnpGZLsEEPb4IjMc1IAqbjgcECDQZ9RBT1IBggr6VODTHVAeO19aqwAGdgi2SOJMCLZPk3/fqt73Gx79kAQByWopMhqsT9k9SfHW34QCA4wTLoJKWgGFSUFbRALYzkyOXucLxHInNJEiRaF2wDFrrlQhHogeOD63FABBuwQRtFjWCK6vgwPviLA8HDvPLP5FKZ535EueuGg4TiiQRCIbQZNQXFTe/GAKbZpcn7TZ3KW28L71PPFZCjM8XzlqVGjW/LSccicHzbS7Ospk2l73DL6ggAFwbfn+JIqnXLRajosmoJf+1cXMch0AwnPUGggk2i17XI9s7oLSNgDdXn35slpCiFxKKOmU26BS6WhWx87gVisS4QDD0O51mZ9Np9qbL3pE/LZRFMEfPyEyXmCRvcSCuZLJcHQCQImIN4NypNJyTdpu7MOYP+qL0yK8t+YMAAAAASUVORK5CYII='
$iconBytes                       = [Convert]::FromBase64String($iconBase64)
$stream                          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length);
$iconImage                       = [System.Drawing.Image]::FromStream($stream, $true)
$WinForm.Icon                    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())

#SeddonLogo
$base64ImageString = "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"
$imageBytes = [Convert]::FromBase64String($base64ImageString)
$ms = New-Object IO.MemoryStream($imageBytes, 0, $imageBytes.Length)
$ms.Write($imageBytes, 0, $imageBytes.Length);
$Seddonlogo = [System.Drawing.Image]::FromStream($ms, $true)

#SeddonLogoPictureBox
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width =  224
$pictureBox.Height =  65 
$pictureBox.Location = New-Object System.Drawing.Size(112,20) 
$pictureBox.Image = $Seddonlogo;



$PWSNameText                     = New-Object system.Windows.Forms.TextBox
$PWSNameText.multiline           = $false
$PWSNameText.text                = "Contract Name"
$PWSNameText.width               = 152
$PWSNameText.height              = 20
$PWSNameText.Anchor              = 'top,right'
$PWSNameText.location            = New-Object System.Drawing.Point(156,177)
$PWSNameText.Font                = 'Segoe UI,10'
$PWSNameText.ForeColor           = "#000000"

$PWSID                           = New-Object system.Windows.Forms.Label
$PWSID.text                      = "Contract Number:"
$PWSID.AutoSize                  = $true
$PWSID.width                     = 25
$PWSID.height                    = 20
$PWSID.Anchor                    = 'top,left'
$PWSID.location                  = New-Object System.Drawing.Point(32,149)
$PWSID.Font                      = 'Segoe UI,10'

$CreateButton                    = New-Object system.Windows.Forms.Button
$CreateButton.text               = "Create PWS Folder"
$CreateButton.width              = 146
$CreateButton.height             = 30
$CreateButton.Anchor             = 'top,left'
$CreateButton.location           = New-Object System.Drawing.Point(136,286)
$CreateButton.Font               = 'Segoe UI,10'


$PWSName                         = New-Object system.Windows.Forms.Label
$PWSName.text                    = "Contract Name:"
$PWSName.AutoSize                = $true
$PWSName.width                   = 25
$PWSName.height                  = 10
$PWSName.Anchor                  = 'top,left'
$PWSName.location                = New-Object System.Drawing.Point(32,179)
$PWSName.Font                    = 'Segoe UI,10'

$PWSIDText                       = New-Object system.Windows.Forms.TextBox
$PWSIDText.multiline             = $false
$PWSIDText.text                  = "EST19XXX"
$PWSIDText.width                 = 152
$PWSIDText.height                = 20
$PWSIDText.Anchor                = 'top,right'
$PWSIDText.location              = New-Object System.Drawing.Point(156,147)
$PWSIDText.Font                  = 'Segoe UI,10'

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Fill out the following form to create your new Project Workspace"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.Anchor                   = 'top,left'
$Label2.location                 = New-Object System.Drawing.Point(13,93)
$Label2.Font                     = 'Segoe UI,10'

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Engineering Services Tenders Folder."
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.Anchor                   = 'top,left'
$Label3.location                 = New-Object System.Drawing.Point(90,114)
$Label3.Font                     = 'Segoe UI,10,style=Bold,Underline'
$Label3.ForeColor                = "#022943"

$ToolTip1                        = New-Object system.Windows.Forms.ToolTip
$ToolTip1.isBalloon              = $false

$ToolTip2                        = New-Object system.Windows.Forms.ToolTip
$ToolTip2.isBalloon              = $false


$ADGroup                         = New-Object system.Windows.Forms.CheckBox
$ADGroup.AutoSize                = $false
$ADGroup.width                   = 100
$ADGroup.height                  = 20
$ADGroup.location                = New-Object System.Drawing.Point(156,209)
$ADGroup.Font                    = 'Microsoft Sans Serif,10'
$ADGroup.Anchor                  = 'top,right'
$ADGroup.Checked                 = $true

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Create AD Group?"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.Anchor                   = 'top,left'
$Label5.location                 = New-Object System.Drawing.Point(32,209)
$Label5.Font                     = 'Segoe UI,10'

$StatusBox                       = New-Object system.Windows.Forms.TextBox
$StatusBox.multiline             = $false
$StatusBox.width                 = 283
$StatusBox.height                = 20
$StatusBox.location              = New-Object System.Drawing.Point(70,255)
$StatusBox.Font                  = 'Microsoft Sans Serif,10'
$StatusBox.MultiLine = $True 


$ToolTip1.SetToolTip($PWSID,'Enter PWS ID (e.g. EST19XXX)')
$ToolTip2.SetToolTip($PWSName,'Enter the name of the contract here (do not include the PWS ID)')
$WinForm.controls.AddRange(@($PWSID,$PWSIDText,$PWSNameText,$CreateButton,$PWSName,$Label2,$Label4,$Label1,$Label3,$ADGroup,$Label5,$Picturebox))

$CreateButton.Add_Enter({  })

$PWSIDText.add_TextChanged({IsThereText})
$PWSNameText.add_TextChanged({IsThereText})

$ProgressPreference = 'SilentlyContinue' ##Silently Import Module
Import-Module ActiveDirectory 

#Function to make sure an empty box cannot be submitted
function IsThereText
{
	if ($PWSNameText.Text.Length -and $PWSIDText.Text.Length -ne 0)
	{
		$CreateButton.Enabled = $true
	}
	else
	{
		$CreateButton.Enabled = $false
	}
}

$CreateButton.Add_Click({

#GUIVariables
$PWSID = $PWSIDtext.text 
$PWSName = $PWSNametext.text

#SecurityGroupVariables
$SG = "SEDDONAD\PWS - $PWSID"
$SGIT = "SEDDONAD\PWS - IT Administrators"
$SGSYSTEM = "SYSTEM"
$SGDA = "SEDDONAD\Domain Admins"

#LocationVariables
$CDest = "\\seddonad.com\ProjectWorkspace\Engineering Services Tenders\$PWSID $PWSName"
$CSource = "\\seddonad.com\ProjectWorkspace\Engineering Services Tenders\EngineeringServicesTemplate"

#New Folder
robocopy "$CSource" "$CDest" /COPY:DAS /E /NFL /NDL /NJH /NJS

#iCACLS Variables
$strGrant = "/grant"
$strInh = "/inheritance:r"
$strDeny = "/deny"
$strRead = "/grant:r"
$strReadVariable = ":r"

$strIcaclsPrms1 = ":(CI)(R,X,RD,RA,REA,WD,WA,WEA)" #Top Level Folder Permisions
$strIcaclsPrms2 = ":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d)" #Files Only Permission
$strICaclsPrms3 = ":(OI)(CI)(F)" #Default Groups after Inheritence is disabled
$strIcaclsPrms4 = ":(OI)(CI)(IO)(M,DC)" #Create folders but not delete root folder pt1
$strIcaclsPrms5 = ":(RX,WD,AD)" #Create folders but not delete root folder pt2
$strIcaclsDefaultPath = "\\seddonad.com\projectworkspace\Engineering Services Tenders\$PWSID $PWSName"


#CreateActiveDirectoryGroup

if ($ADGroup.Checked -eq $true)
{

New-ADGroup -Name "PWS - $PWSID" -GroupCategory Security -GroupScope Global -Path 'OU=PWS - Engineering Services Tenders,OU=Project WorkSpace,OU=Security Groups,DC=seddonad,DC=com'
}


#Root Folder Level
#Testing
#icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Engineering Services Tenders\Test Contract Name 3" /grant:r "seddonad\PWS - Test":r
#icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Engineering Services Tenders\Test Contract Name 3\2. Tender Launch" /grant:r "seddonad\PWS - Test":(CI)(r,x,rd,ra,rea,wd,wa,wea) /t
#icacls "\\SEDDONAD.COM\PROJECTWORKSPACE\Engineering Services Tenders\Test Contract Name 3\2. Tender Launch" /grant:r "seddonad\PWS - Test":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d) /t


Invoke-Expression -Command ('icacls $strIcaclsDefaultPath $strRead "$SG$strReadVariable"')


#File Permissions 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\1. Prelim Book" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\1. Prelim Book" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\1. Prelim Book" $strGrant "$SG$strIcaclsPrms5"')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\2. Mechanical Cost" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\2. Mechanical Cost" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\2. Mechanical Cost" $strGrant "$SG$strIcaclsPrms5"')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\3. Electrical Cost" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\3. Electrical Cost" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1. Tender Adjudication\3. Electrical Cost" $strGrant "$SG$strIcaclsPrms5"') 

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2. Tender Launch" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2. Tender Launch" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2. Tender Launch" $strGrant "$SG$strIcaclsPrms5"') 

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\0. File Setup" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\0. File Setup" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\0. File Setup" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\1. ITT" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\2. Drawings" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\2. Drawings" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\2. Drawings" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\3. Specification" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\4. Employers Requirements" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\5. Quotations" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\5. Quotations" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\5. Quotations" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\6. Emails" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\7. Take Off Sheets" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\8. Tender" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\9. Suppliers" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\9. Suppliers" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3. Mechanical Tender\9. Suppliers" $strGrant "$SG$strIcaclsPrms5"') 

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\0. File Setup" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\0. File Setup" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\0. File Setup" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\1. ITT" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\1. ITT" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\2. Drawings" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\2. Drawings" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\2. Drawings" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\3. Specification" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\3. Specification" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\4. Employers Requirements" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\4. Employers Requirements" $strGrant "$SG$strIcaclsPrms5"') 

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

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\6. Emails" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\6. Emails" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\7. Take Off Sheets" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\7. Take Off Sheets" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\8. Tender" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\8. Tender" $strGrant "$SG$strIcaclsPrms5"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4. Electrical Tender\9. Suppliers" $strGrant "$SG$strIcaclsPrms2"/t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5. Tender Return Letter" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5. Tender Return Letter" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5. Tender Return Letter" $strGrant "$SG$strIcaclsPrms5"') 

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6. Handover" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6. Handover" $strGrant "$SG$strIcaclsPrms4"') 
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6. Handover" $strGrant "$SG$strIcaclsPrms5"') 

[System.Windows.Forms.MessageBox]::Show('Project Workspace Folder Successfully Created!', 'Success!')

})


[void]$WinForm.ShowDialog()