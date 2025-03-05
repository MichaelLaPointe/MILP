####  I just had ChatGPT write this for me to show how out of hand things can get. 
####  I haven't even tested it yet. I THINK I know what it does, but who knows?

# Network Diagnostic Tool
# Created by: [Your Name]
# Date: [Current Date]
# Purpose: This script helps diagnose network connectivity issues by running Ping and TRACERT
#          commands on a specified IP address.

# First, let's help the user find their IP address

Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "         NETWORK CONNECTIVITY DIAGNOSTIC TOOL          " -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "If you need to help a user find their IP address, guide them through these steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "For Windows users:" -ForegroundColor Green
Write-Host "1. Press Win+R to open the Run dialog"
Write-Host "2. Type 'cmd' and press Enter"
Write-Host "3. In the command prompt, type 'ipconfig' and press Enter"
Write-Host "4. Look for 'IPv4 Address' under their active connection"
Write-Host ""
Write-Host "For Mac users:" -ForegroundColor Green
Write-Host "1. Click the Apple menu and select 'System Preferences'"
Write-Host "2. Click on 'Network'"
Write-Host "3. Select their active connection (Wi-Fi or Ethernet)"
Write-Host "4. Their IP address will be displayed on the right"
Write-Host ""

# Get the target IP address from the user
$ipAddress = Read-Host -Prompt "Enter the IP address you want to test"

# Validate that something was entered
if ([string]::IsNullOrWhiteSpace($ipAddress)) {
    Write-Host "No IP address was entered. Exiting script." -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "Starting network diagnostics for IP: $ipAddress" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan


# PING SECTION
# ------------
# The Ping command sends ICMP Echo Request packets to the target IP address.
# It helps determine:
# 1. If the remote device is reachable
# 2. How long it takes packets to reach the device and return (latency)
# 3. If there is packet loss along the route

Write-Host ""
Write-Host "Running PING test..." -ForegroundColor Green
Write-Host "What this tells us: Whether the device is reachable and the response time." -ForegroundColor Gray
Write-Host "=======================================================" -ForegroundColor Cyan

# Run the ping command with 4 packets
$pingResults = ping -n 4 $ipAddress

# Display the results
$pingResults | ForEach-Object { Write-Host $_ }

# Extract and analyze the ping statistics
$packetLoss = if ($pingResults -match "(\d+)% loss") { $Matches[1] } else { "Unable to determine" }
$pingTimes = if ($pingResults -match "Minimum = (\d+)ms, Maximum = (\d+)ms, Average = (\d+)ms") { 
    "Min: $($Matches[1])ms, Max: $($Matches[2])ms, Avg: $($Matches[3])ms" 
} else { 
    "Unable to determine ping times because Dylan Sucks" 
}

# Provide an interpretation of the results
Write-Host ""
Write-Host "PING Results Summary:" -ForegroundColor Cyan
Write-Host "---------------------" -ForegroundColor Cyan
Write-Host "Packet Loss: $packetLoss%" -ForegroundColor $(if ($packetLoss -eq "0") { "Green" } elseif ($packetLoss -match "^\d+$" -and [int]$packetLoss -lt 25) { "Yellow" } else { "Red" })
Write-Host "Ping Times: $pingTimes" -ForegroundColor $(if ($pingTimes -match "Unable") { "Red" } else { "Green" })


# TRACERT SECTION
# --------------
# The TRACERT command traces the route that packets take to reach the target.
# It helps determine:
# 1. The path (hops) that packets take to reach the destination
# 2. Where in the network path delays or packet loss might be occurring
# 3. If there are routing problems between your network and the destination

Write-Host ""
Write-Host "Running TRACERT test..." -ForegroundColor Green
Write-Host "What this tells us: The path your connection takes through the internet and where delays occur." -ForegroundColor Gray
Write-Host "=======================================================" -ForegroundColor Cyan

# Run the tracert command
$tracertResults = tracert -d $ipAddress

# Display the results
$tracertResults | ForEach-Object { Write-Host $_ }

# Count the number of hops and identify any timeouts
$hopCount = ($tracertResults | Where-Object { $_ -match '^\s*\d+' }).Count
$timeouts = ($tracertResults | Where-Object { $_ -match '\*\s+\*\s+\*' }).Count

# Provide an interpretation of the results
Write-Host ""
Write-Host "TRACERT Results Summary:" -ForegroundColor Cyan
Write-Host "------------------------" -ForegroundColor Cyan
Write-Host "Total Hops: $hopCount" -ForegroundColor Green
Write-Host "Timeouts/Failures: $timeouts" -ForegroundColor $(if ($timeouts -eq 0) { "Green" } elseif ($timeouts -lt 3) { "Yellow" } else { "Red" })

if ($timeouts -gt 0) {
    Write-Host "Note: Timeouts may indicate firewalls blocking ICMP packets rather than actual network failures." -ForegroundColor Yellow
}


# CONCLUSION
# ----------
Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "                   ANALYSIS COMPLETE                   " -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

# Provide overall assessment
if ($packetLoss -eq "0" -and $timeouts -eq 0) {
    Write-Host "Overall Assessment: GOOD CONNECTION" -ForegroundColor Green
    Write-Host "The connection to $ipAddress appears to be stable and performing well."
} elseif (($packetLoss -match "^\d+$" -and [int]$packetLoss -lt 25) -or $timeouts -lt 3) {
    Write-Host "Overall Assessment: MINOR ISSUES" -ForegroundColor Yellow
    Write-Host "The connection to $ipAddress has some minor issues that might affect performance."
    Write-Host "Recommendation: Monitor the connection and consider running these tests again later."
} else {
    Write-Host "Overall Assessment: CONNECTION PROBLEMS" -ForegroundColor Red
    Write-Host "The connection to $ipAddress shows significant issues."
    Write-Host "Recommendations:"
    Write-Host "- Check local network configuration"
    Write-Host "- Contact your ISP if the problem persists"
    Write-Host "- For internal networks, check network equipment between source and destination"
}

Write-Host ""
Write-Host "Diagnostic tests completed at $(Get-Date)" -ForegroundColor Gray


<# 
POSSIBLE SCRIPT EXPANSIONS:
---------------------------
1. Add a DNS lookup test using Resolve-DnsName
2. Include a Test-NetConnection command to check specific ports
3. Save results to a file for easier sharing
4. Add a graphical interface using Windows Forms
5. Create a loop to monitor connectivity over time
6. Add the ability to test multiple IP addresses from a list
#>

# Example of saving results to a file
$resultsFile = "C:\Scripts\NetworkDiagnostics_Results_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
Write-Host "Saving detailed results to: $resultsFile" -ForegroundColor Cyan

# Create a string with all our results
$allResults = @"
===============================================================
         NETWORK CONNECTIVITY DIAGNOSTIC TOOL RESULTS          
===============================================================
Target IP: $ipAddress
Test Time: $(Get-Date)

PING RESULTS:
$($pingResults -join "`n")

Packet Loss: $packetLoss%
Ping Times: $pingTimes

TRACERT RESULTS:
$($tracertResults -join "`n")

Total Hops: $hopCount
Timeouts/Failures: $timeouts

OVERALL ASSESSMENT:
$(if ($packetLoss -eq "0" -and $timeouts -eq 0) {
    "GOOD CONNECTION: The connection appears to be stable and performing well."
} elseif (($packetLoss -match "^\d+$" -and [int]$packetLoss -lt 25) -or $timeouts -lt 3) {
    "MINOR ISSUES: The connection has some minor issues that might affect performance."
} else {
    "CONNECTION PROBLEMS: The connection shows significant issues."
})
===============================================================
"@

# Save to file
$allResults | Out-File -FilePath $resultsFile -Encoding UTF8

Write-Host "Results have been saved to file. You can open it or email it to share the diagnostics." -ForegroundColor Green