# This checks if your profile exists (True/False)clr

Test-Path $PROFILE

# Creates your profile file if it doesn't exist
New-Item -Path $PROFILE -Type File -Force

# If it is a NEW profile, running the next command should display nothing.

Get-Content $PROFILE
