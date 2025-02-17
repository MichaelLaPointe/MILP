#######   PROFILES

Test-Path $PROFILE  # If it returns TRUE, then you have one.. If it returns FALSE...

New-Item -Path $PROFILE -ItemType File -Force  # Create a new profile. 

$PROFILE   # Shows you where the profile is stored.

notepad $PROFILE  # Opens your profile in Notepad

Set-Alias list Get-ChildItem
Clear-Host
Write-Host "Welcome back, Michael!" -ForegroundColor Green
$host.PrivateData.ErrorForegroundColor = 'Cyan'
$host.PrivateData.ErrorBackgroundColor = 'Black'
Set-Location C:\MILP

# After saving your profile, just type POWERSHELL in your shell. POwershell will reload with the new profile.