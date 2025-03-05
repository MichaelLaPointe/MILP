#  Simplest Version

    cls
    $Target = Read-Host "Enter the IP address or hostname to test"
    Write-Host "`n=== PING Test Results for $Target ===" -ForegroundColor Cyan
    ping $Target
    Write-Host "`n=== TRACERT Route to $Target ===" -ForegroundColor Yellow
    tracert $Target

# You remembered to run Start-Transcript, right?