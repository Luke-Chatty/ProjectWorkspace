#Start-Transcript E:\scripts\AddMultipleUsersToMultipleGroups.txt -Append
$DefaultUserSearchBase = "OU=SCL,OU=Seddon Users Directory,DC=seddonad,DC=com"
$DefaultGroupSearchBase = "OU=Project WorkSpace,OU=Security Groups,DC=seddonad,DC=com"
$AdGroupsInfo = Get-ADGroup -Filter * -SearchBase $DefaultGroupSearchBase | Sort-Object Name
$AdUsersInfo = Get-ADUser -Filter *
$OUs = Get-ADOrganizationalUnit -LDAPFilter '(name=*)'-SearchBase "$DefaultUserSearchBase" -SearchScope OneLevel | Select Name, DistinguishedName
$DefaultOU = "Users"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()


function Fill_Listboxitems
{
    If($OUDropDown.Text -ne "All")
    {
        $UserssSearchTextbox.Text = $null
        $UsersListbox.Items.Clear()
        $Searchbase = "OU=" + $OUDropDown.Text + ",$DefaultUserSearchBase"
        $ADusers = Get-ADUser -Filter * -SearchBase $Searchbase | Sort-Object SamAccountName
        Foreach($ADuser in $ADusers)
        {
            $UsersListbox.Items.Add($ADuser.SamAccountName) | Out-Null
        }
    }
}

function Search_Users
{
    If($UserssSearchTextbox.Text.Length -gt 0)
    {
        $OUDropDown.Text = "All"
        $UsersListbox.Items.Clear()
        If($UserssSearchTextbox.Text.Length -gt 0) { $AdUsers = $AdUsersInfo | Where SamAccountName -Match $UserssSearchTextbox.Text }
        foreach($AdUser in $AdUsers)
        {
            $UsersListbox.Items.Add($AdUser.SamAccountName) | Out-Null
        }
    }
}

function Refresh_Adgroups
{
    $GroupsListbox.Items.Clear()
    If($GroupsSearchTextbox.Text.Length -gt 0) { $AdGroups = $AdGroupsInfo | Where Name -Match $GroupsSearchTextbox.Text }
    Else { $AdGroups = $AdGroupsInfo }
    foreach($AdGroup in $AdGroups)
    {
        $GroupsListbox.Items.Add($AdGroup.Name) | Out-Null
    }
}

function Add_SelectedUsers
{
    $SelectedUsers = $UsersListbox.SelectedItems
    Foreach($SelectedUser in $SelectedUsers)
    {
        $SelectedUsersListbox.Items.Add($SelectedUser) | Out-Null
    }
}

function Remove_SelectedUsers
{
    $SelectedUser = $SelectedUsersListbox.SelectedItem
    $SelectedUsersListbox.Items.Remove($SelectedUser) | Out-Null
}

function Add_Group
{
    $form2 = New-Object System.Windows.Forms.Form
    $form2.Text = 'Create Group'
    $form2.Size = New-Object System.Drawing.Size(270,110)
    $form2.StartPosition = 'CenterScreen'

    $OKButton = New-Object System.Windows.Forms.Button
    $OKButton.Location = New-Object System.Drawing.Point(10,35)
    $OKButton.Size = New-Object System.Drawing.Size(50,23)
    $OKButton.Text = 'OK'
    $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
    $form2.AcceptButton = $OKButton
    $form2.Controls.Add($OKButton)

    $CancelButton = New-Object System.Windows.Forms.Button
    $CancelButton.Location = New-Object System.Drawing.Point(70,35)
    $CancelButton.Size = New-Object System.Drawing.Size(50,23)
    $CancelButton.Text = 'Cancel'
    $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form2.CancelButton = $CancelButton
    $form2.Controls.Add($CancelButton)

    $GroupNameTextBox = new-object System.Windows.Forms.Textbox
    $GroupNameTextBox.Location = new-object System.Drawing.Size(10,10)
    $GroupNameTextBox.Size = new-object System.Drawing.Size(230,40)
    $GroupNameTextBox.Focus()
    $GroupNameTextBox.Text = ""

    $form2.Controls.Add($GroupNameTextBox)
    $form2.Topmost = $true

    $form2.Add_Shown({$form2.Activate(); $GroupNameTextBox.focus()})
    
    $AddGroupResult = $form2.ShowDialog()
    
    If ($AddGroupResult -eq [System.Windows.Forms.DialogResult]::OK)
    {
        $GroupName = $GroupNameTextBox.Text  # Get the text box' text now.
        Write-Host "OK clicked: Creating group: $GroupName"
        New-ADGroup -Name "$GroupName" -SamAccountName "$GroupName" -DisplayName "$GroupName" -GroupCategory Security -GroupScope Global -Path $DefaultGroupsOU
        $AdGroupsInfo = Get-ADGroup -Filter * -SearchBase $DefaultGroupSearchBase | Sort-Object Name
        Refresh_Adgroups
    }
    Else
    {
        Write-Host "Cancel was clicked. No group created"
    }    
}

function AddUsers_toGroups
{
    Write-Host "Adding user(s) to group(s)"
    If($SelectedUsersListbox.Items.Count -eq 0)
    {
        $Users = @()
        Foreach($item in $UsersListbox.SelectedItems)
        {
            $Users += Get-ADUser $item
        }
    }
    Else
    {
        $Users = @()
        Foreach($item in $SelectedUsersListbox.Items)
        {
            $Users += Get-ADUser $item
        }
    }
    $Groups = $GroupsListbox.SelectedItems
    If($GroupsListbox.SelectedItems.Count -gt 0)
    {
        Foreach($SelectedGroup in $GroupsListbox.SelectedItems)
        {
            Add-ADGroupMember -Identity $SelectedGroup -Members $Users
        }
    }
    $Userinfo = ""
    Foreach($User in $Users)
    {
        $Userinfo = $Userinfo + $User.SamAccountName + ","
    }
    $Userinfo = $Userinfo.Remove($Userinfo.LastIndexOf(","))
    Write-Host "Selected user(s):"
    Write-Host $Userinfo
    Write-Host "Selected group(s):"
    Write-Host $Groups
    [System.Windows.MessageBox]::Show("Added`r`n$Userinfo `r`nto `r`n$Groups")
    $UserssSearchTextbox.Text = ""
    $GroupsSearchTextbox.Text = ""
    $SelectedUsersListbox.Items.Clear()
    $UsersListbox.SelectedItems.Clear()
    $GroupsListbox.SelectedItems.Clear()
}

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Project Workspace - Add users to group(s)'
$form.Size = New-Object System.Drawing.Size(800,350)
$form.StartPosition = 'CenterScreen'
$form.BackColor = "#f7fcff"


$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(10,260)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(85,260)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$NewGroupButton = New-Object System.Windows.Forms.Button
$NewGroupButton.Location = New-Object System.Drawing.Point(380,260)
$NewGroupButton.Size = New-Object System.Drawing.Size(75,23)
$NewGroupButton.Text = 'New group'
$NewGroupButton.Add_Click({Add_Group})
$form.Controls.Add($NewGroupButton)

$AddUsersToGroupButton = New-Object System.Windows.Forms.Button
$AddUsersToGroupButton.Location = New-Object System.Drawing.Point(460,260)
$AddUsersToGroupButton.Size = New-Object System.Drawing.Size(125,23)
$AddUsersToGroupButton.Text = 'Add users to group(s)'
$AddUsersToGroupButton.Add_Click({AddUsers_toGroups})
$form.Controls.Add($AddUsersToGroupButton)

$LabelUsers = New-Object System.Windows.Forms.Label
$LabelUsers.Location = New-Object System.Drawing.Point(10,20)
$LabelUsers.Size = New-Object System.Drawing.Size(350,20)
$LabelUsers.Text = 'Please select users from the list below (type below to search):'
$form.Controls.Add($LabelUsers)

$UserssSearchTextbox = new-object System.Windows.Forms.Textbox
$UserssSearchTextbox.Location = new-object System.Drawing.Size(10,40)
$UserssSearchTextbox.Size = new-object System.Drawing.Size(160,40)
$UserssSearchTextbox.Add_TextChanged({Search_Users})
$UserssSearchTextbox.SelectedText = ""
$form.Controls.Add($UserssSearchTextbox)

$OUDropDown = new-object System.Windows.Forms.ComboBox
$OUDropDown.Location = new-object System.Drawing.Size(10,65)
$OUDropDown.Size = new-object System.Drawing.Size(160,40)
$OUDropDown.Add_SelectedIndexChanged({Fill_Listboxitems})
foreach($OU in $OUs)
{
    $OUDropDown.Items.Add($OU.Name) | Out-Null
}
$OUDropDown.Items.Add("All") | Out-Null
$OUDropDown.SelectedText = "$DefaultOU"
$form.Controls.Add($OUDropDown)

$UsersListbox = New-Object System.Windows.Forms.Listbox
$UsersListbox.Location = New-Object System.Drawing.Point(10,90)
$UsersListbox.Size = New-Object System.Drawing.Size(160,20)
$UsersListbox.SelectionMode = 'MultiExtended'
$UsersListbox.Height = 150
$form.Controls.Add($UsersListbox)

$LabelSelectedUsers = New-Object System.Windows.Forms.Label
$LabelSelectedUsers.Location = New-Object System.Drawing.Point(200,70)
$LabelSelectedUsers.Size = New-Object System.Drawing.Size(100,20)
$LabelSelectedUsers.Text = 'Selected users:'
$form.Controls.Add($LabelSelectedUsers)

$SelectedUsersListbox = New-Object System.Windows.Forms.Listbox
$SelectedUsersListbox.Location = New-Object System.Drawing.Point(200,90)
$SelectedUsersListbox.Size = New-Object System.Drawing.Size(160,20)
$SelectedUsersListbox.Height = 150
$form.Controls.Add($SelectedUsersListbox)

$AddSelectedUsersButton = New-Object System.Windows.Forms.Button
$AddSelectedUsersButton.Location = New-Object System.Drawing.Point(175,100)
$AddSelectedUsersButton.Size = New-Object System.Drawing.Size(20,23)
$AddSelectedUsersButton.Text = '>'
$AddSelectedUsersButton.Add_Click({Add_SelectedUsers})
$form.Controls.Add($AddSelectedUsersButton)

$RemoveSelectedUsersButton = New-Object System.Windows.Forms.Button
$RemoveSelectedUsersButton.Location = New-Object System.Drawing.Point(175,125)
$RemoveSelectedUsersButton.Size = New-Object System.Drawing.Size(20,23)
$RemoveSelectedUsersButton.Text = '<'
$RemoveSelectedUsersButton.Add_Click({Remove_SelectedUsers})
$form.Controls.Add($RemoveSelectedUsersButton)

$LabelGroups = New-Object System.Windows.Forms.Label
$LabelGroups.Location = New-Object System.Drawing.Point(380,20)
$LabelGroups.Size = New-Object System.Drawing.Size(350,20)
$LabelGroups.Text = 'Please select the groups to add them to (type below to filter):'
$form.Controls.Add($LabelGroups)

$GroupsListbox = New-Object System.Windows.Forms.Listbox
$GroupsListbox.Location = New-Object System.Drawing.Point(380,80)
$GroupsListbox.Size = New-Object System.Drawing.Size(350,20)
$GroupsListbox.SelectionMode = 'MultiExtended'
$GroupsListbox.Height = 160
$form.Controls.Add($GroupsListbox)

$GroupsSearchTextbox = new-object System.Windows.Forms.Textbox
$GroupsSearchTextbox.Location = new-object System.Drawing.Size(380,40)
$GroupsSearchTextbox.Size = new-object System.Drawing.Size(350,40)
$GroupsSearchTextbox.Add_TextChanged({Refresh_Adgroups})
$GroupsSearchTextbox.SelectedText = ""
$form.Controls.Add($GroupsSearchTextbox)

Fill_Listboxitems

$form.Topmost = $true

$Result = $form.ShowDialog()


if ($Result -eq [System.Windows.Forms.DialogResult]::OK)
{
    AddUsers_toGroups
}
else
{
    Write-Host "Cancel pressed"
}
Stop-Transcript