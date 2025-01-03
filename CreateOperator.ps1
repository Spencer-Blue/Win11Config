# Define variables with descriptive names
$AdministratorUsername = "Operator"
$AdministratorDescription = "Main User Account"

# Create the user account without a password
try {
    New-LocalUser -Name $AdministratorUsername -Description $AdministratorDescription -NoPassword
} catch {
    Write-Host "Failed to create user: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Read password securely 
$Password = ConvertTo-SecureString "Operator" -AsPlainText -Force

# Set the password and hint for the user
try {
    $UserAccount = Get-LocalUser -Name $AdministratorUsername
    $UserAccount | Set-LocalUser -Password $Password
} catch {
    Write-Host "Failed to set password: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
# Add the user to the Users group
try {
    Add-LocalGroupMember -Group "users" -Member $AdministratorUsername
} catch {
    Write-Host "Failed to add user to Users group: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Add the user to the Administrators group
try {
    Add-LocalGroupMember -Group "Administrators" -Member $AdministratorUsername
} catch {
    Write-Host "Failed to add user to Administrators group: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "Administrator user '$AdministratorUsername' created successfully." -ForegroundColor Green