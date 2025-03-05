####    Lets Build A Network Troubleshooting Script

# Simple PowerShell script to run PING and TRACERT on an IP address or hostname

# What is PING?
# PING is a command-line tool used to test the reachability 
# of a device (computer, server, router, etc.) on a network. It sends small data packets 
# to the target and waits for a response, measuring how long it takes.
# A successful PING means the target is online and reachable.
# It was written in 1983 by Mike Muuss, an employee of the US Army Research
# Labratory. He named it after the sound SONAR makes. The internet has given it the 
# BACKRONYM "Package InterNet Groper."

# What is TRACERT?
# TRACERT (Trace Route) is another command-line tool that shows the path 
# that data takes to reach a destination on a network. It lists all the 
# routers (hops) the data passes through, which helps identify slow or 
# problematic network connections.

# Prompt the user to enter an IP address or hostname
# - IP address: A numerical label assigned to devices on a network (e.g., 8.8.8.8)
# - Hostname: A human-readable name that resolves to an IP address (e.g., google.com)
$Target = Read-Host "Enter the IP address or hostname to test"

# Display a section header for the PING test
Write-Host "`n=== PING Test Results for $Target ===" -ForegroundColor Cyan

# Run the PING command to check if the target is reachable
# - The `ping` command will send a few packets and wait for a response.
# - If there’s a response, the target is online. If not, it might be unreachable.
ping $Target

# Display a section header for the TRACERT test
Write-Host "`n=== TRACERT Route to $Target ===" -ForegroundColor Yellow

# Run the TRACERT command to trace the path to the target
# - This shows all network devices (hops) between your computer and the destination.
# - If there’s a slow or broken connection, you can see where the issue is.
tracert $Target

# End of script
# - This script helps users understand basic network troubleshooting.
# - If the PING fails, the target may be offline or blocked.
# - If TRACERT shows delays or timeouts, there may be network congestion or firewall restrictions.
