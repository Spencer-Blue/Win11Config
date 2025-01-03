function DefaultPrinterManagement{ 
    # Define the registry key path
    $RegistryKeyPath = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows"

    # Define the value name
    $ValueName = "LegacyDefaultPrinterMode"

    # Define the value data
    $ValueData = 0

    # Check if the registry key exists
    if (!(Test-Path -Path $RegistryKeyPath)) {
        # Create the registry key if it doesn't exist
        New-Item -Path $RegistryKeyPath -Type RegistryKey
    }

    # Set the registry value
    Set-ItemProperty -Path $RegistryKeyPath -Name $ValueName -Value $ValueData

    # Verify the registry value change
    $CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).LegacyDefaultPrinterMode
    if ($CurrentValue -eq $ValueData) {
        Write-Host "*****Default Printer Management Registry key value set to "$ValueData" successfully.*****" -ForegroundColor Green
    } else {
        Write-Host "Failed to set Default Printer Management registry key value to "$ValueData"." -ForegroundColor Red
    }
}
DefaultPrinterManagement