# Cut and paste whatever parts of this profile you want to use.


# ARRAY of random Powershell Title Bar data
# These could be fun (movie quotes, song lyrics), educatonal (notes from a cert you are studying), etc. 
$titles = @(
    "There comes a time in every man's life when he has to look the potato of injustice right in the eye. There's a powerful evil force in the universe that lives in Channel 8 and I've seen it",
    "Ghetto lady thinks your froggy's name is Lou McGopher, A piggy baby leaving Arizona slipped and fell last night; A banana wanted in that crack, Who really thinks you have a Waldo sack?",
    "Trogdor was a man! I mean, he was a dragon man! Or, maybe he was just a dragon! But he was still Trogdor! Trogdor! Burninating the countryside!",
    "The 9000 series is the most reliable computer ever made. No 9000 computer has ever made a mistake or distorted information. Not like Dylan. Dylan Sucks!",
    "I'm Nikolas Van Helsing, professor of proctology and other related tendencies. A graduate of the University of Rangoon and assorted night classes at the Knoxville, Tennessee School of Faith Healing."
)

# Select a random title
$randomTitle = $titles | Get-Random

# Set the PowerShell window title
$Host.UI.RawUI.WindowTitle = $randomTitle

Set-Alias list Get-ChildItem
Set-Alias flushdns Clear-DnsClientCache

Set-Location C:\Temp

# Customize error message colors. Red on dark blue (magenta) is TOO hard to see for me
$Host.PrivateData.ErrorForegroundColor = 'Green'     # Text color of error messages
$Host.PrivateData.ErrorBackgroundColor = 'Black'     # Background color of error messages

# Optional: Customize other error-related colors
$Host.PrivateData.WarningForegroundColor = 'Black'     # Text color of warning messages
$Host.PrivateData.WarningBackgroundColor = 'Yellow'    # Background color of warnings

# Customize your Prompt!
function prompt {
    Write-Host "PS [" -NoNewline
    Write-Host (Get-Location) -ForegroundColor Green -NoNewline
    Write-Host "]> " -NoNewline
    return " "
}
