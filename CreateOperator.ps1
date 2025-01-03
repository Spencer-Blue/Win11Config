# Define variables with descriptive names
$AdministratorUsername = "Operator"
$AdministratorDescription = "Main User Account"

# Create the user account without a password
try {
    New-LocalUser -Name $AdministratorUsername -Description $AdministratorDescription -NoPassword
} catch {
    Write-Warning "Failed to create user: $($_.Exception.Message)"
    exit 1
}

# Read password securely 
$Password = Read-Host -AsSecureString -Prompt "Enter Password"

# Set the password and hint for the user
try {
    $UserAccount = Get-LocalUser -Name $AdministratorUsername
    $UserAccount | Set-LocalUser -Password $Password
} catch {
    Write-Warning "Failed to set password and hint: $($_.Exception.Message)"
    exit 1
}
# Add the user to the Users group
try {
    Add-LocalGroupMember -Group "users" -Member $AdministratorUsername
} catch {
    Write-Warning "Failed to add user to Users group: $($_.Exception.Message)"
    exit 1
}

# Add the user to the Administrators group
try {
    Add-LocalGroupMember -Group "Administrators" -Member $AdministratorUsername
} catch {
    Write-Warning "Failed to add user to Administrators group: $($_.Exception.Message)"
    exit 1
}

Write-Host "Administrator user '$AdministratorUsername' created successfully."