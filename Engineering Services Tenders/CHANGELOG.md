
# Changelog
All notable changes and history will be saved here. 

## Version [1.5] - 06/11/19
#### Added
- Permissions for Folder 4.5 Quotations to allow for creation of folders

#### Changed
- Change method used to prompt the script has completed to allow pop-up message box to be always-on-top

#### Fixed
- Fixed creation AD account from failing with account mapping in iCACLS

## Version [1.4] - 30/09/19
#### Added
- Modified all anchors to allow for different resolutions. Size is no-longer fixed and if the default window is warped user can resize accordingly.
- Set default state of checkbox to checked, 90% of the time an AD group will be created. (previously unchecked)

#### Changed
- Fixed clipping issue with Construction project label.
- Fixed permission issue where users could save outside folder structure despite not being able to see what they save.

#### Removed

## Version [1.3] - 30/09/19
#### Added
- Add $ProgressPreference = 'SilentlyContinue' to prevent import module progress bar from loading

## Version [1.2] - 30/09/19
##### Added 
- Import-Module ActiveDirectory added as manual step upon launch to prevent errors later on in script.


## Version [1.0] 27/09/1

#### Added
Replaced bat script.
Configured in Powershell instead.
Replaced xcopy with robocopy.
Created and configured GUI to ease process




