[![version][version-badge]][CHANGELOG]

# Construction Projects - Project Workspace

Project Workspace Script for Construction Projects

Updates and links to download will be saved here.

[Download Powershell]

[Download Executable (.exe)]

## Changelog
All notable changes and history will be saved here. 

## Version [1.4] - 30/09/19
### Added
- Modified all anchors to allow for different resolutions. Size is no-longer fixed and if the default window is warped user can resize accordingly.
- Set default state of checkbox to checked, 90% of the time an AD group will be created. (previously unchecked)

### Changed
- Fixed clipping issue with Construction project label.
- Fixed permission issue where users could save outside folder structure despite not being able to see what they save.

### Removed

## Version [1.3] - 30/09/19
### Added
- Add $ProgressPreference = 'SilentlyContinue' to prevent import module progress bar from loading

## Version [1.2] - 30/09/19
### Added 
- Import-Module ActiveDirectory added as manual step upon launch to prevent errors later on in script.


## Version [1.0] 27/09/19

### Added
Replaced bat script.
Configured in Powershell instead.
Replaced xcopy with robocopy.
Created and configured GUI to ease process


[1.4]: https://github.com/olivierlacan/keep-a-changelog/compare/v0.3.0...v1.0.0


[CHANGELOG]: ./CHANGELOG.md
[LICENSE]: ./LICENSE
[ruby-version]: .ruby-version
[source]: source/
[version-badge]: https://img.shields.io/badge/version-1.4-blue.svg
[Download Powershell]: https://github.com/LukeSeddon/ProjectWorkspace/blob/master/Construction/PWS-Construction.ps1
[Download Executable (.exe)]: https://github.com/LukeSeddon/ProjectWorkspace/blob/master/Construction/PWS-Construction.exe
