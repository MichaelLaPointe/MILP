## Open your profile with one of these commands

ise $PROFILE
notepad $PROFILE
code $PROFILE

# Add in the folowing lines to get started

# Customize your welcome message
Write-Host "Tell them -MikeIsLearningPowerShell- Sent You!" -ForegroundColor Green

# Create functions for System Admin tasks
function Get-DiskSpace { 
Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} | Select-Object DeviceID, VolumeName, @{Name="SizeGB";Expression={[math]::Round($_.Size/1GB,2)}}, @{Name="FreeGB";Expression={[math]::Round($_.FreeSpace/1GB,2)}} 
}

# Create an alias for our function
Set-Alias -Name disk -Value Get-DiskSpace

# Create a function that clears the screen and then drops down three lines
function clr {
Clear-Host ; Write-Host `n`n`n
}
# and then run the function. Anytime during your session, you can type "clr" 
clr