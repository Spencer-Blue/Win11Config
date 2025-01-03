function ChangeTimeZone{

    # Define the registry key path
    $RegistryKeyPath = "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"

    # Define the value name
    $ValueName = "TimeZoneKeyName"

    # Define the value data
    $ValueData = "Central Standard Time"

    # Check if the registry key exists
    if (!(Test-Path -Path $RegistryKeyPath)) {
        # Create the registry key if it doesn't exist
        New-Item -Path $RegistryKeyPath -Type RegistryKey
    }

    # Set the registry value
    Set-ItemProperty -Path $RegistryKeyPath -Name $ValueName -Value $ValueData

    # Verify the registry value change
    $CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).TimeZoneKeyName
    if ($CurrentValue -eq $ValueData) {
        Write-Host "*****Time Zone key value set to "$ValueData" successfully.*****" -ForegroundColor Green
    } else {
        Write-Host "Failed to set Time Zone registry key value to "$ValueData"." -ForegroundColor Red
    }
}
ChangeTimeZone
