# Devopstrio AVD Automation Runbook
# Name: Scale-Hostpool.ps1
# Description: Intelligent scaling of AVD session hosts based on active user demand.

param (
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory=$true)]
    [string]$HostPoolName,

    [Parameter(Mandatory=$false)]
    [int]$MinHosts = 2,

    [Parameter(Mandatory=$false)]
    [int]$MaxHosts = 20
)

$ErrorActionPreference = "Stop"

Write-Output "--- AVD Scaling Sequence Started ---"
Write-Output "Pool: $HostPoolName | ResourceGroup: $ResourceGroupName"

try {
    # 1. Fetch current Host Pool State
    # In production: $hostPool = Get-AzWvdHostPool -ResourceGroupName $ResourceGroupName -Name $HostPoolName
    Write-Output "[INFO] Retrieving current session density metrics..."
    $activeSessions = Get-Random -Minimum 10 -Maximum 500 # Mock session count
    $currentHosts = Get-Random -Minimum 5 -Maximum 15     # Mock host count
    
    $sessionsPerHost = $activeSessions / $currentHosts
    Write-Output "[INFO] Metrics: Sessions=$activeSessions, Hosts=$currentHosts, Ratio=$($sessionsPerHost.ToString('F2'))"

    # 2. Decision Logic
    if ($sessionsPerHost -gt 10 -and $currentHosts -lt $MaxHosts) {
        Write-Output "[ACTION] Scaling UP. Provisioning new session host instance..."
        # In production: Start-AzVm -ResourceGroupName $RG -Name $VmName
        Start-Sleep -Seconds 2
        Write-Output "[SUCCESS] New host provisioned and registered with AVD registration token."
    }
    elseif ($sessionsPerHost -lt 3 -and $currentHosts -gt $MinHosts) {
        Write-Output "[ACTION] Scaling DOWN. Setting least utilized host to DRAIN mode."
        # In production: Update-AzWvdSessionHost -DrainMode $true
        Start-Sleep -Seconds 2
        Write-Output "[SUCCESS] Host identified as idle. Shutdown scheduled for end of session."
    }
    else {
        Write-Output "[INFO] Pool density is optimal. No action required."
    }

} catch {
    Write-Error "CRITICAL FAILURE in Scaling Runbook: $($_.Exception.Message)"
    exit 1
}

Write-Output "--- AVD Scaling Sequence Completed ---"
