# Dot-source the function scripts
. "C:\DeplomentScripts\Windows11Scripts\CreateLocalUser.ps1"
. "C:\DeplomentScripts\Windows11Scripts\SetAutoLogin.ps1"
. "C:\DeplomentScripts\Windows11Scripts\AdjustSystemPerformance.ps1"
. "C:\DeplomentScripts\Windows11Scripts\UncheckWindowsDefaultPrinter.ps1"
. "C:\DeplomentScripts\Windows11Scripts\DisableStartMenuRecommendationsAndHistory.ps1"
. "C:\DeplomentScripts\Windows11Scripts\RemoveLocalUser.ps1"
. "C:\DeplomentScripts\Windows11Scripts\EnableXPSViewer.ps1"
. "C:\DeplomentScripts\Windows11Scripts\DownloadAndInstallDotNetSdks.ps1"
. "C:\DeplomentScripts\Windows11ScriptsAddUsersToAdministratorsGroup.ps1"
. "C:\DeplomentScripts\Windows11Scripts\ImportScheduledTask.ps1"

Write-Output "Starting script execution"

# Create users
createLocalUser -username "Operator" -password "Operator"
createLocalUser -username "Haynes Admin" -password "3@syAsP1eEyeS@y"

# Add users to the Administrators group
addUsersToAdministratorsGroup -usernames @("Operator", "Haynes Admin")

# Set Operator to Auto-Login
setAutoLogin -username "Operator" -password "Operator"

# Adjust system performance
adjustSystemPerformance

# Uncheck "Let Windows manage my default printer"
uncheckWindowsDefaultPrinter

# Disable online recommendations and history in the Start menu
disableStartMenuRecommendationsAndHistory

# Remove the temporary user account
#removeLocalUser -username "Temp"

# Enable XPS Viewer
enableXPSViewer

# Download and install .NET SDKs
downloadAndInstallDotNetSdks

# Import AdminWV and Backup PLC&SCADA files into Task Scheduler
$taskXmlPath1 = "C:\WW\AdminWV.xml"
$taskName1 = "AdminWV"
importScheduledTask -taskXmlPath $taskXmlPath1 -taskName $taskName1

$taskXmlPath2 = "C:\WW\Backup PLC&SCADA files.xml"
$taskName2 = "Backup PLC&SCADA files"
importScheduledTask -taskXmlPath $taskXmlPath2 -taskName $taskName2

Write-Output "Script execution completed"

# Placeholder for renaming NICs
# Example usage: Rename-NetAdapter -Name "CurrentName" -NewName "NewName"
# Rename-NetAdapter -Name "Ethernet" -NewName "PrimaryAdapter"
