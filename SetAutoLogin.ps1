function setAutoLogin {
    param (
        [string]$username,
        [string]$password
    )
    Write-Output "Setting auto-login for user: $username"
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
    Set-ItemProperty -Path $regPath -Name "AutoAdminLogon" -Value "1"
    Set-ItemProperty -Path $regPath -Name "DefaultUserName" -Value $username
    Set-ItemProperty -Path $regPath -Name "DefaultPassword" -Value $password
    Write-Output "Auto-login set for user: $username"
}
