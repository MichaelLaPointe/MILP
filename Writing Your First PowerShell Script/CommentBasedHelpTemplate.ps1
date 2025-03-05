# Comment Based Help
# Run Get-Help Get-Process. See the structure? You can do that too!

<#
.SYNOPSIS
    Tests an IP Address for connectivity

.DESCRIPTION
     Simple PowerShell script to run PING and TRACERT on an IP address or hostname

 What is PING?
 PING is a command-line tool used to test the reachability 
 of a device (computer, server, router, etc.) on a network. It sends small data packets 
 to the target and waits for a response, measuring how long it takes.
 A successful PING means the target is online and reachable.
 It was written in 1983 by Mike Muuss, an employee of the US Army Research
 Labratory. He named it after the sound SONAR makes. The internet has given it the 
 BACKRONYM "Package InterNet Groper."

 What is TRACERT?
 TRACERT (Trace Route) is another command-line tool that shows the path 
 that data takes to reach a destination on a network. It lists all the 
 routers (hops) the data passes through, which helps identify slow or 
 problematic network connections.

.PARAMETER Target
    Target defines the IP Address

.EXAMPLE
    Example of how to use the script/function.
    PS> .\SimpleNetworkTroubleshootingScript -Target 8.8.8.8

.INPUTS
    IP Address

.OUTPUTS
    N/A

.NOTES
    Author - Mike Is Learning PowerShell
    Copyright March, 2025
    OK, so, Let's just make it Creative Commons. I mean, it's just Ping and TRACERT

.LINK
   https://youtu.be/r8E0CbYZcjE?si=AqavyAVjY2JTsNSg
#>

function SimpleNetworkTroubleshootingScript {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Target
    )

    $Target = Read-Host "Enter the IP address or hostname to test"
    Write-Host "`n=== PING Test Results for $Target ===" -ForegroundColor Cyan
    ping $Target
    Write-Host "`n=== TRACERT Route to $Target ===" -ForegroundColor Yellow
    tracert $Target
}
