function disableStartMenuRecommendationsAndHistory {
    Write-Output "Disabling online recommendations and history in the Start menu"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Value 0
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 0
    Write-Output "Online recommendations and history disabled in the Start menu"
}
