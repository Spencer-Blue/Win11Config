function removeLocalUser {
    param (
        [string]$username
    )
    Write-Output "Removing local user: $username"
    if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
        Remove-LocalUser -Name $username
        Write-Output "User '$username' has been removed."
    } else {
        Write-Output "User '$username' does not exist."
    }
}
