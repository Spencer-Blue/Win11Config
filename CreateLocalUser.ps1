function createLocalUser {
    param (
        [string]$username,
        [string]$password
    )
    Write-Output "Creating local user: $username"
    New-LocalUser -Name $username -Password (ConvertTo-SecureString $password -AsPlainText -Force) -PasswordNeverExpires $true
    Write-Output "User $username created successfully."
}
