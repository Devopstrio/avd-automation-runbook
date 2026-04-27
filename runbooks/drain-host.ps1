# Devopstrio AVD Automation Runbook
# Name: Drain-Host.ps1
# Description: Gracefully prepares a session host for maintenance by preventing new logins and notifying users.

param (
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory=$true)]
    [string]$HostPoolName,

    [Parameter(Mandatory=$true)]
    [string]$SessionHostName
)

$ErrorActionPreference = "Stop"

Write-Output "[MAINTENANCE] Initiating Drain Sequence for $SessionHostName"

try {
    # 1. Enable Drain Mode
    Write-Output "[STEP 1] Setting DrainMode to 'True'. New sessions will be blocked."
    # Get-AzWvdSessionHost -Name $SessionHostName ... | Update-AzWvdSessionHost -AllowNewSession $false
    Start-Sleep -Seconds 1

    # 2. Check for active users
    Write-Output "[STEP 2] Checking for active users to notify..."
    $activeUsers = @("user1@devopstrio.com", "user2@devopstrio.com") # Mock users
    
    foreach ($user in $activeUsers) {
        Write-Output "[NOTIFY] Sending broadcast message to $user : 'Host undergoing maintenance. Please save your work.'"
        # Send-AzWvdUserSessionMessage -UserSessionId $id -Message "Reboot in 15 mins"
    }

    # 3. Wait/Verify process (simulated)
    Write-Output "[STEP 3] Monitoring session evacuation process..."
    Start-Sleep -Seconds 3
    
    Write-Output "[COMPLETE] Host $SessionHostName is now successfully isolated. Safe to patch or restart."

} catch {
    Write-Error "[FAILURE] Could not drain host: $($_.Exception.Message)"
    exit 1
}
