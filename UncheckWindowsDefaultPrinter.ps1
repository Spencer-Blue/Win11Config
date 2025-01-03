function uncheckWindowsDefaultPrinter {
    Write-Output "Unchecking 'Let Windows manage my default printer'"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows" -Name "LegacyDefaultPrinterMode" -Value 1
    Write-Output "'Let Windows manage my default printer' unchecked"
}
uncheckWindowsDefaultPrinter