
<#Powershell script to manage security groups and distribution groups for a single user with windows forms GUI.  
  You should not have to customize any code in this script for it to work. Just extract the AD folder to C:\ . 
  I've included a shortcut that will launch the script. I may take a second for the form to load. 

   You must search for users by their logon id. #>
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
Import-Module ActiveDirectory


##function to populate the current group list box with the users current security group membership
function cgroups { process {
      $group10 = Get-ADPrincipalGroupMembership -Identity $id2 | select Name | Where-Object {$_.name -like '*PWS*' }
      foreach($groups in $group10){
                 $Currentgroups.Items.Add($groups.Name);
             }
       }
}

# function to populate the allgroups listbox with all current security groups located in the domain AD
function sgroups { process{

     $group1 = get-adgroup -Filter {name -like "*PWS*"}
     foreach($group in $group1){
                 $allgroups.Items.Add($group.Name)
              }
      }
}


function clear {  process{

           $Currentgroups.Items.Clear();
           $userid.Text = "";
     }

}


#convert system drawing to a displayable image and displays it in the image box. 
function success { process {
$base64ImageString = "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"
$imageBytes = [Convert]::FromBase64String($base64ImageString)
$ms = New-Object IO.MemoryStream($imageBytes, 0, $imageBytes.Length)
$ms.Write($imageBytes, 0, $imageBytes.Length);
$tick = [System.Drawing.Image]::FromStream($ms, $true)
  $pbox2.Image = $tick;

}
}

#convert system drawing to a displayable image and displays it in the image box. 
function fail { process {
  $file2 = (Get-Item "$ScriptDir\redx.jpg")
  $img2 = [System.Drawing.Image]::Fromfile($file2);
  $pbox2.Image = $img2;

}
}


#clears specified fields and selected items
function cclear { process{

           Start-Sleep -Seconds 3
           $pbox2.Image = $null;
           $complete1.text = "";
           $allgroups.ClearSelected()
}
}



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

$allgroups = New-Object system.windows.Forms.ListBox
$allgroups.Text = "listBox"
$allgroups.Width = 249
$allgroups.Height = 221
$allgroups.location = new-object system.drawing.point(320,94)
$Form.controls.Add($allgroups)

$userID = New-Object system.windows.Forms.TextBox
$userID.Width = 100
$userID.Height = 20
$userID.location = new-object system.drawing.point(86,25)
$userID.Font = "Segoe UI,10"
$Form.controls.Add($userID)

$label8 = New-Object system.windows.Forms.Label
$label8.Text = "UserID:"
$label8.AutoSize = $true
$label8.Width = 25
$label8.Height = 10
$label8.location = new-object system.drawing.point(16,26)
$label8.Font = "Segoe UI,10"
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
$button10.Font = "Segoe UI,10"
$Form.controls.Add($button10)


#adds user to group selected in either the distribution groups listbox or the security groups listbox
$button12 = New-Object system.windows.Forms.Button
$button12.Text = "Add"
$button12.Width = 250
$button12.Height = 34
$button12.Add_MouseClick({

             $sgroup = $allgroups.SelectedItems;
              Add-ADPrincipalGroupMembership -Identity $id2 -MemberOf $sgroup;
              success;
              $complete1.Text = "Added to group";
              Start-Sleep -Seconds 1;
              $Currentgroups.Items.Clear();
              cgroups;
              cclear;
             
})
$button12.location = new-object system.drawing.point(320,334)
$button12.Font = "Segoe UI,10"
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
$button15.Font = "Segoe UI,10"
$Form.controls.Add($button15)

$pbox2 = New-Object system.windows.Forms.PictureBox
$pbox2.Width = 65
$pbox2.Height = 65
$pbox2.location = new-object system.drawing.point(430,1)
$Form.controls.Add($pbox2)

$complete1 = New-Object system.windows.Forms.Label
$complete1.AutoSize = $true
$complete1.Width = 25
$complete1.Height = 10
$complete1.location = new-object system.drawing.point(350,7)
$complete1.Font = "Segoe UI,10"
$Form.controls.Add($complete1)

$label23 = New-Object system.windows.Forms.Label
$label23.Text = "User's Current PWS Groups"
$label23.AutoSize = $true
$label23.Width = 25
$label23.Height = 10
$label23.location = new-object system.drawing.point(18,74)
$label23.Font = "Segoe UI,10"
$Form.controls.Add($label23)

$label25 = New-Object system.windows.Forms.Label
$label25.Text = "List of All PWS Groups"
$label25.AutoSize = $true
$label25.Width = 25
$label25.Height = 10
$label25.location = new-object system.drawing.point(340,74)
$label25.Font = "Segoe UI,10"
$Form.controls.Add($label25)

$GroupsSearchTextbox = new-object System.Windows.Forms.Textbox
$GroupsSearchTextbox.Location = new-object System.Drawing.Size(380,40)
$GroupsSearchTextbox.Size = new-object System.Drawing.Size(350,40)
#$GroupsSearchTextbox.Add_TextChanged({Refresh_Adgroups})
$GroupsSearchTextbox.SelectedText = ""
$form.Controls.Add($GroupsSearchTextbox)


[void]$Form.ShowDialog()
$Form.Dispose()