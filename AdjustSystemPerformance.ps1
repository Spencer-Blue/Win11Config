function adjustSystemPerformance {
    Write-Output "Adjusting system performance settings"
    Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90,0x12,0x01,0x80))
    Set-ItemProperty -Path "HKLM:\Control Panel\Desktop" -Name "DragFullWindows" -Value 0
    Write-Output "System performance settings adjusted"
}
