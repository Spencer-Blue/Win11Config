function addUsersToAdministratorsGroup {
    param (
        [string[]]$usernames
    )
    Write-Output "Adding users to the Administrators group"
    foreach ($username in $usernames) {
        Add-LocalGroupMember -Group "Administrators" -Member $username
        Write-Output "User '$username' added to the Administrators group"
    }
    Write-Output "All specified users have been added to the Administrators group"
}
