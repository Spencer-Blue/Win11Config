# Define the registry key path
$RegistryKeyPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device"

# Define the value name
$ValueName = "DevicePasswordLessBuildVersion"

# Define the value data
$ValueData = 1

# Check if the registry key exists
if (!(Test-Path -Path $RegistryKeyPath)) {
    # Create the registry key if it doesn't exist
    New-Item -Path $RegistryKeyPath -Type RegistryKey
}

# Set the registry value
Set-ItemProperty -Path $RegistryKeyPath -Name $ValueName -Value $ValueData -Type DWord

# Verify the registry value change
$CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).DevicePasswordLessBuildVersion
if ($CurrentValue -eq $ValueData) {
    Write-Host "Registry key value set to 1 successfully."
} else {
    Write-Warning "Failed to set registry key value to 1."
}