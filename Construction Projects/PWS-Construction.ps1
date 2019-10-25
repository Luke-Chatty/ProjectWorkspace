<#
.Synopsis
   PWS Script for Construction Projects
.DESCRIPTION
   This script will capture user input, create an AD group in the correct OU, take a copy of the folder structure template and apply correct permissions of newly created AD group using iCACLs.
.NOTES
  Version:        1.4
  Author:         Luke Chatburn
  Creation Date:  30/09/19
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
$WinForm.text                    = "PWS - New Construction Project"
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
$PWSIDText.text                  = "S0500"
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
$Label3.text                     = "Construction Project Folder."
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.Anchor                   = 'top,left'
$Label3.location                 = New-Object System.Drawing.Point(111,114)
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


$ToolTip1.SetToolTip($PWSID,'Enter PWS ID (e.g. S0500)')
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
#Introduction

#InitialVariables

$PWSID = $PWSIDtext.text 
$PWSName = $PWSNametext.text
$CDest = "\\seddonad.com\ProjectWorkspace\Construction Projects\$PWSID $PWSName"
$CSource = "\\seddonad.com\ProjectWorkspace\Construction Projects\ContractTemplateDEV"



#iCACLS Variables
$SG = "SEDDONAD\PWS - $PWSID"
$SGIT = "SEDDONAD\PWS - IT Administrators"
$SGSYSTEM = "SYSTEM"
$SGDA = "SEDDONAD\Domain Admins"

$strGrant = "/grant"
$strInh = "/inheritance:r"
$strRead = "/grant:r"
$strIcaclsDefaultPath = "\\seddonad.com\ProjectWorkspace\Construction Projects\$PWSID $PWSName"
$strIcaclsPrmsTopLvl = ":r"
$strIcaclsPrms1 = ":(CI)(r,x,rd,ra,rea,wd,wa,wea)" #Top Level Folder Permisions
$strIcaclsPrms2 = ":(OI)(IO)(r,x,rd,ra,rea,wd,wa,wea,ad,d)" #Files Only Permission
$strICaclsPrms3 = ":(OI)(CI)(F)" #Default Groups after Inheritence is disabled
$strIcaclsPrms4 = ":(OI)(CI)(IO)(M,DC)" #Create folders but not delete root folder pt1
$strIcaclsPrms5 = ":(RX,WD,AD)" #Create folders but not delete root folder pt2

if ($ADGroup.Checked -eq $true)
{
New-ADGroup -Name "PWS - $PWSID" -GroupCategory Security -GroupScope Universal -Path 'OU=LIVE,OU=PWS - Construction,OU=Project WorkSpace,OU=Security Groups,DC=seddonad,DC=com'
}


#Copy Folder 
robocopy "$CSource" "$CDest" /COPY:DAS /E /NFL /NDL /NJH /NJS

##Top Level Permissions
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath" $strRead "$SG$strIcaclsPrmsTopLvl"')

##Setting Level 1 Permissions

#Permissions for 1.0##
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1.0 Contract Documents" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\1.0 Contract Documents" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.4 Design Team Meetings" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.5 Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)" $strGrant "$SG$strIcaclsPrms1" /t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)\2.7.1 WIP Design Models" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)\2.7.2 Shared Models" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)\2.7.3 Federated Models(NWF,NWD)" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)\2.7.4 Model Comments, Clash Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\2.0 Design-A-Site Folder\2.7 3D Model Info (Seddon Only)\2.7.5 Model Renders" $strGrant "$SG$strIcaclsPrms2" /t')



Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3.0 Project Mobilsation" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3.1 Decision to Proceed Meeting" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3.2 Profit Plan" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\3.3 Site Set Up" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.1 Employers" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.2 Employers Agent" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.3 Architect" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.4 Structure" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.5 M&E" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.6 Misc Design Team" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.7 Utility" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.8 Sub-Contractor" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\4.0 Correspondence\4.9 PQS" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.1 Project Team Meetings" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.2 Client Meeting and Contractor Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.3 Project Management Plan" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.4 Inspection and Test  Plan" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.5 Sub Contract Meetings" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.6 Site Diary" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.7 Service Connections and Utilities" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.8 Material and Plant" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.9 MCR" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.10 Information Required Schedule" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.11 RFI-SVI Schedule" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.12 Procurement Schedule" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.13 Planning Permissions and Building Regs" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.14 Construction Programme" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.15 Delivery Programme" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.16 Misc Programme" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.17 Progressed Programme" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.18 Planning Progress Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.19 Resident Liaison" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.20 Site Photos" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.21 Inspection records" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.22 Trackers" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.23 A-Site BIM Protocols" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.24 Setting Out and Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.25 Section Agreements" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\5.0 Project Delivery\5.26 Social Value" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.1 Construction Phase Plan" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.2 Method Statements and Risk Assessments" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.3 COSHH Assessments" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.4 Waste Management" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.5 Aspects and Impact Register" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.6 Monthly Returns" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.7 Sustainability Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.8 Toolbox Talks" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.9 Audits" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.10 Non Conformance Reports" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.11 Near Misses" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.12 Test Certificates" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.13 Third Party Inspections" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.14 Permits to Work" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.15 Asbestos" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\6.0 SHEQ\6.16 Temporary Works" $strGrant "$SG$strIcaclsPrms2" /t')



Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.1 CVR" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.2 Externals Valuations" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.3 Contractor Trade Library Index" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.4 Sub contract or Consultant enquiries" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.5 Sub contract or Consultant Orders" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.6 Warranties Bonds etc" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.7 Sub contract or Consultant Payment Applications" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.8 Sub contract or Consultant Payment Notices" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.9 Sub contract or Consultant Performance Review" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.10 Sub contract or Consultant Claims or Disputes" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.11 Seddon Direct Work" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.12 Materials" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.13 Plant" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.14 Preliminaries" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.15 Measurement" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.16 Utilities and Statutory Bodies" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.17 Authorities" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.18 Cheque Requisitions" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.19 Contractual Notices" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.20 Variation Pricing" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.21 EOTDelaysClaims" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.22 Value Engineering - Optioneering" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.23 QS Photos - Records" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.24 Insurances" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\7.0 Commercial\7.25 Liquidations or Administrations" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare" $strGrant "$SG$strIcaclsPrms1" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.1 O&M" $strInh $strGrant "$SGIT$strICaclsPrms3" $strGrant "$SGSYSTEM$strICaclsPrms3" $strGrant "$SGDA$strICaclsPrms3"') #Grant System, Domain Admins and PWS Admins
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.1 O&M" $strGrant "$SG$strIcaclsPrms4"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.1 O&M" $strGrant "$SG$strIcaclsPrms5"')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.2 Customer Care" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.3 As Built Drawings" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.4 Defect Management" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.5 Handover Schedule" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.6 12 Month Defect List" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\8.0 Handover and Aftercare\8.7 Client Training" $strGrant "$SG$strIcaclsPrms2" /t')


Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering" $strGrant "$SG$strIcaclsPrms1" /t')

Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.1 CAD As Built Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.2 CAD Supplied Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.3 CAD Rotated Design Drawings" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.4 Cad Site Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.5 Modelling As Built Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.6 Modelling Supplied Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.7 Modelling Site Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.8 Modelling Volume Calcs" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.9 Pdf As Built Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.10 Pdf Supplied Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.11 Pdf Site Surveys" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.12 Pdf Volume Calcs" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.13 Site Control" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.14 Design Queries" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.15 Setting Out" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.16 Tw Prep" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.17 Raw Data" $strGrant "$SG$strIcaclsPrms2" /t')
Invoke-Expression -Command ('icacls "$strIcaclsDefaultPath\9.0 Engineering\9.18 Workings Area" $strGrant "$SG$strIcaclsPrms2" /t')




#File Permissions  

[System.Windows.Forms.MessageBox]::Show('Project Workspace Folder Successfully Created!', 'Success!')

})



[void]$WinForm.ShowDialog()