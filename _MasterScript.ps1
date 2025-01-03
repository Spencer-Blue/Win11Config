Write-Host "Preparing to install Microsoft .NET SDKs" -ForegroundColor Magenta
& .\DownloadAndInstallDotNetSdks.ps1
Write-Host "Enabling Passwordless Logon for Netplwiz" -ForegroundColor Magenta
& .\NetplwizRegedit.ps1
Write-Host "Changing Default Printer Managment" -ForegroundColor Magenta
& \.uncheckWindowsDefaultPrinter
Write-Host "Creating Operator Account" -ForegroundColor Magenta
& .\CreateOperator.ps1
Write-Host "Creating Haynes Admin Account" -ForegroundColor Magenta
& .\CreateHaynesAdmin.ps1