function importScheduledTask {
    param (
        [string]$taskXmlPath,
        [string]$taskName
    )

    # Check if the XML file exists
    if (-Not (Test-Path -Path $taskXmlPath)) {
        Write-Output "Error: XML file '$taskXmlPath' not found."
        return
    }

    # Import the scheduled task from the XML file
    try {
        Register-ScheduledTask -Xml (Get-Content $taskXmlPath | Out-String) -TaskName $taskName
        Write-Output "Scheduled task '$taskName' has been imported successfully."
    } catch {
        Write-Output "Error: Failed to import the scheduled task. $_"
    }
}
