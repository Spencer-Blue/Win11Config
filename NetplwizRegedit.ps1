function NoPassLogin{ 
    # Define the registry key path
    $RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device"

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
    Set-ItemProperty -Path $RegistryKeyPath -Name $ValueName -Value $ValueData

    # Verify the registry value change
    $CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).DevicePasswordLessBuildVersion
    if ($CurrentValue -eq $ValueData) {
        Write-Host "*****Passwordless Login Registry key value set to "$ValueData" successfully.*****" -ForegroundColor Green
    } else {
        Write-Host "Failed to set Passwordless Login registry key value to "$ValueData"." -ForegroundColor Red
    }
}
NoPassLogin