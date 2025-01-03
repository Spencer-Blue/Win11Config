function disableStartMenuHistory {
        # Define the registry key path
        $RegistryKeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

        # Define the value name
        $ValueName = "Start_TrackDocs"
    
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
        $CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).Start_TrackDocs
        if ($CurrentValue -eq $ValueData) {
            Write-Host "*****Disable Start Histroy Registry key value set to "$ValueData" successfully.*****" -ForegroundColor Green
        } else {
            Write-Host "Failed to set Start History registry key value to "$ValueData"." -ForegroundColor Red
        }
}
disableStartMenuHistory
function DisableStartRecommendations{ 
    # Define the registry key path
    $RegistryKeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"

    # Define the value name
    $ValueName = "SystemPaneSuggestionsEnabled"

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
    $CurrentValue = (Get-ItemProperty -Path $RegistryKeyPath -Name $ValueName).SystemPaneSuggestionsEnabled
    if ($CurrentValue -eq $ValueData) {
        Write-Host "*****Disable Start Recommendation Registry key value set to "$ValueData" successfully.*****" -ForegroundColor Green
    } else {
        Write-Host "Failed to set Start Recommendation registry key value to "ValueData"." -ForegroundColor Red
    }
}
DisableStartRecommendations