#######    Parameters 

Get-Process       # You get a bunch of stuff

Get-Process -Name powershell    # You get just the Powershell stuff
Get-Process powershell    # since -Name is the first positional parameter, it's optional
Get-Process powershell, notepad    # You can name MULTIPLE values for parameters
Get-Process power*   # Using the * Wildcard, you also get powershell_ise

Get-Help Get-Process    # Look at the SYNTAX section

Stop-Process -Id     # Get the Id of an individual process you wnt to kill and run this. 

Get-Help -Online about_Parameters