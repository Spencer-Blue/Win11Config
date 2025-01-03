# Define variables with descriptive names
$HaynesAdminUsername = "Haynes Admin"
$HaynesAdminDescription = "Haynes Admin Account"

# Create the user account without a password
try {
    New-LocalUser -Name $HaynesAdminUsername -Description $HaynesAdminDescription -NoPassword
} catch {
    Write-Warning "Failed to create user: $($_.Exception.Message)"
    exit 1
}

# Read password securely 
$Password = Read-Host -AsSecureString -Prompt "Enter Password for Haynes Admin"

# Set the password and hint for the user
try {
    $UserAccount = Get-LocalUser -Name $HaynesAdminUsername
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
    Add-LocalGroupMember -Group "Administrators" -Member $HaynesAdminUsername
} catch {
    Write-Warning "Failed to add user to Administrators group: $($_.Exception.Message)"
    exit 1
}

Write-Host "Haynes Admin user created successfully."