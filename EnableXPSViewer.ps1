function enableXPSViewer {
    Write-Output "Enabling XPS Viewer"
    Enable-WindowsOptionalFeature -Online -FeatureName "XPSViewer" -All
    Write-Output "XPS Viewer enabled"
}
