[![version][version-badge]][CHANGELOG] [![license][license-badge]][LICENSE]

### Construction Projects - Project Workspace

##Version 1.8 (30/09/19)##
Modified all anchors to allow for different resolutions. Size is no-longer fixed and if the default window is warped user can resize accordingly.
Fixed clipping issue with Construction project label.
Fixed permission issue where users could save outside folder structure despite not being able to see what they save.
Set default state of checkbox to checked, 90% of the time an AD group will be created. (previously unchecked)

##Version 1.0 (27/09/19)##

Replaced bat script.
Configured in Powershell instead.
Replaced xcopy with robocopy.
Fixed issue with root levels 1.0/2.0/3.0 etc being able to save files in despite the user not seeing saved files.
Created and configured GUI to ease process

##Version 1.1 (27/09/19)##

Adjusted Template folder to DEV

##Version 1.2 (30/09/19)##
Import-Module ActiveDirectory added as manual step upon launch to prevent errors later on in script.

##Version 1.3 (30/09/19)##
Add $ProgressPreference = 'SilentlyContinue' to prevent import module progress bar from loading

