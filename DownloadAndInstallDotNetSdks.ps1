function downloadAndInstallDotNetSdks {
    Write-Output "Starting download and installation of .NET SDKs"

    # URLs for .NET SDKs (Update these URLs with the latest version URLs from the official .NET download page)
    $dotnet6Url = "https://download.visualstudio.microsoft.com/download/pr/0814dade-52c0-4f97-83f4-21f784b03a2e/6f0d4b4dc596824a365b63882982031b/dotnet-sdk-6.0.423-win-x64.exe"
    $dotnet8Url = "https://download.visualstudio.microsoft.com/download/pr/b6f19ef3-52ca-40b1-b78b-0712d3c8bf4d/426bd0d376479d551ce4d5ac0ecf63a5/dotnet-sdk-8.0.302-win-x64.exe"

    # Paths to save the installers
    $dotnet6Path = "C:\Users\Operator\Downloads\dotnet-sdk-6.0.exe"
    $dotnet8Path = "C:\Users\Operator\Downloads\dotnet-sdk-8.0.exe"

    # Function to download a file
    function downloadFile {
        param (
            [string]$url,
            [string]$outputPath
        )
        Write-Output "Downloading from $url"
        Invoke-WebRequest -Uri $url -OutFile $outputPath
        Write-Output "Downloaded $url to $outputPath"
    }

    # Function to install a downloaded file
    function installSoftware {
        param (
            [string]$filePath
        )
        Write-Output "Installing software from $filePath"
        Start-Process -FilePath $filePath -ArgumentList "/quiet", "/norestart" -Wait
        Write-Output "Installed software from $filePath"
    }

    # Download .NET 6.0 SDK
    downloadFile -url $dotnet6Url -outputPath $dotnet6Path

    # Download .NET 8.0 SDK
    downloadFile -url $dotnet8Url -outputPath $dotnet8Path

    # Install .NET 6.0 SDK
    installSoftware -filePath $dotnet6Path

    # Install .NET 8.0 SDK
    installSoftware -filePath $dotnet8Path

    Write-Output "Completed download and installation of .NET SDKs"
}