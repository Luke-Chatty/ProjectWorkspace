
<#Powershell script to manage security groups and distribution groups for a single user with windows forms GUI.  
  You should not have to customize any code in this script for it to work. Just extract the AD folder to C:\ . 
  I've included a shortcut that will launch the script. I may take a second for the form to load. 

   You must search for users by their logon id. #>
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
Import-Module ActiveDirectory


$Form = New-Object system.Windows.Forms.Form
$Form.Text = "PWS - Add or Remove Individual User"
$Form.TopMost = $true
$Form.Width = 600
$Form.BackColor = "#f7fcff"
$Form.Height = 433


$Currentgroups = New-Object system.windows.Forms.ListBox
$Currentgroups.Text = "listBox"
$Currentgroups.Width = 249
$Currentgroups.Height = 221
$Currentgroups.location = new-object system.drawing.point(17,94)
$Form.controls.Add($Currentgroups)

$GroupsListbox = New-Object system.windows.Forms.ListBox
$GroupsListbox.Text = "listBox"
$GroupsListbox.Width = 249
$GroupsListbox.Height = 221
$GroupsListbox.location = new-object system.drawing.point(320,94)
$Form.controls.Add($GroupsListbox)

$dgroups = New-Object system.windows.Forms.ListBox
$dgroups.Text = "listBox"
$dgroups.Width = 249
$dgroups.Height = 221
$dgroups.location = new-object system.drawing.point(620,94)
$Form.controls.Add($dgroups)


$userID = New-Object system.windows.Forms.TextBox
$userID.Width = 100
$userID.Height = 20
$userID.location = new-object system.drawing.point(86,25)
$userID.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($userID)

$label8 = New-Object system.windows.Forms.Label
$label8.Text = "UserID:"
$label8.AutoSize = $true
$label8.Width = 25
$label8.Height = 10
$label8.location = new-object system.drawing.point(16,26)
$label8.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label8)



#finds user specified in text box and returns their group membership to the Currentgroups listbox. 
$button10 = New-Object system.windows.Forms.Button
$button10.Text = "Find"
$button10.Width = 101
$button10.Height = 20
$button10.Add_MouseClick({
               $script:id2 = $userID.Text;
               $getu = Get-ADUser -Identity $id2
               
              $Currentgroups.Items.Clear();
              $pbox2.Image = $null;
              $complete1.Text = "";
              if($getu -eq $null){
                 fail;
                 $complete1.Text = "User Not Found";
              }else {
                 cgroups;
                 success;
                 $complete1.Text = "User Found";
                 cclear;
              
              }       

})
$button10.location = new-object system.drawing.point(213,25)
$button10.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($button10)


#adds user to group selected in either the distribution groups listbox or the security groups listbox
$button12 = New-Object system.windows.Forms.Button
$button12.Text = "Add"
$button12.Width = 250
$button12.Height = 34
$button12.Add_MouseClick({

             $sgroup = $allgroups.SelectedItems;
             $mgroup = $dgroups.SelectedItems;
              Add-ADPrincipalGroupMembership -Identity $id2 -MemberOf $sgroup;
              Add-ADPrincipalGroupMembership -Identity $id2 -MemberOf $mgroup;
              success;
              $complete1.Text = "Added to group";
              Start-Sleep -Seconds 1;
              $Currentgroups.Items.Clear();
              cgroups;
              cclear;
             
})
$button12.location = new-object system.drawing.point(320,334)
$button12.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($button12)


#removes user from selected group in "Current Groups" list box and refreshes the results of that box. 
$button15 = New-Object system.windows.Forms.Button
$button15.Text = "Remove"
$button15.Width = 249
$button15.Height = 30
$button15.Add_MouseClick({
           $group = $Currentgroups.SelectedItem;

           Remove-ADGroupMember -Identity $group -Member $id2 -Confirm: $false;
           $complete1.Text = "Completed"
           success;
           $Currentgroups.Items.Clear();
           cgroups;
           cclear;
           
})
$button15.location = new-object system.drawing.point(17,335)
$button15.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($button15)

$pbox2 = New-Object system.windows.Forms.PictureBox
$pbox2.Width = 98
$pbox2.Height = 78
$pbox2.location = new-object system.drawing.point(452,4)
$Form.controls.Add($pbox2)

$complete1 = New-Object system.windows.Forms.Label
$complete1.AutoSize = $true
$complete1.Width = 25
$complete1.Height = 10
$complete1.location = new-object system.drawing.point(350,7)
$complete1.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($complete1)

$label23 = New-Object system.windows.Forms.Label
$label23.Text = "Current Groups"
$label23.AutoSize = $true
$label23.Width = 25
$label23.Height = 10
$label23.location = new-object system.drawing.point(18,74)
$label23.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label23)

$label25 = New-Object system.windows.Forms.Label
$label25.Text = "Security groups"
$label25.AutoSize = $true
$label25.Width = 25
$label25.Height = 10
$label25.location = new-object system.drawing.point(340,74)
$label25.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label25)

$label27 = New-Object system.windows.Forms.Label
$label27.Text = "Distribution Groups"
$label27.AutoSize = $true
$label27.Width = 25
$label27.Height = 10
$label27.location = new-object system.drawing.point(620,74)
$label27.Font = "Microsoft Sans Serif,10"
$Form.controls.Add($label27)


$GroupsSearchTextbox = new-object System.Windows.Forms.Textbox
$GroupsSearchTextbox.Location = new-object System.Drawing.Size(380,40)
$GroupsSearchTextbox.Size = new-object System.Drawing.Size(350,40)
$GroupsSearchTextbox.Add_TextChanged({Refresh_Adgroups})
$GroupsSearchTextbox.SelectedText = ""
$form.Controls.Add($GroupsSearchTextbox)


sgroups

##function to populate the current group list box with the users current security group membership
function cgroups { process {
      $group10 = Get-ADPrincipalGroupMembership -Identity $id2 | select Name | Where-Object {$_.name -like '*PWS*' }
      foreach($groups in $group10){
                 $Currentgroups.Items.Add($groups.Name);
             }
       }
}


function Fill_Listboxitems
   {
       $GroupsSearchTextbox.Text = $null
       $GroupsListbox.Items.Clear()
       $ADGroup = Get-ADGroup -Filter {name -like "*PWS*"} | Sort-Object Name
       Foreach($ADGroup in $ADGroup)
       {
            $GroupsListbox.Items.Add($group.Name) | Out-Null
        }
    }

function Refresh_Adgroups
{
    $GroupsListbox.Items.Clear()
    If($GroupsSearchTextbox.Text.Length -gt 0) { $AdGroups = $Group1 | Where Name -Match $GroupsSearchTextbox.Text }
    Else { $AdGroups = $group1 }
    foreach($Group in $group1)
    {
        $GroupsListbox.Items.Add($Group.Name) | Out-Null
    }
}

function clear {  process{

           $Currentgroups.Items.Clear();
           $userid.Text = "";
     }

}




[void]$Form.ShowDialog()
$Form.Dispose()