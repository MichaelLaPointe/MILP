#######     ALIASES

## Don't work EXACTLY the same as in Linux. You may have to make a function instead if you want parameters and such.
## Do not use aliases in scripts or functions. 

ls
dir
gci

Get-Alias  # Show the list of all the aliases

Set-Alias -Name cert -Value Get-TrustedProvisioningCertificate  # Create a SHORT alias for LONG cmdlet
Set-Alias -Name list -Value Get-ChildItem  # Create a new alias

# Let's add an alias to the $profile we made earlier.
Add-Content $PROFILE "`nalias list = 'Get-ChildItem'"  # The backtick and n ( ` above your tab key) creates a NEW LINE. Escape Character

Get-Alias  # Should now show our new alias we created.









##  Bonus for people who downloaded this and scrolled down..
##  Here's how we make a function that mimics "ls -la" from Bash
##  since it won't work as an alias.

function ls-la {

Get-ChildItem -force   # This will show hidden files as well

}