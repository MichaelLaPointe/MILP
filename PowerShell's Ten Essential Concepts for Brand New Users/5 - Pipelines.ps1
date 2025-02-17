#######   PIPELINES 

## You can connect multiple commands together using the pipe symbol 

Get-Service | Where-Object { $_.Name -match "y" } # Gets a list of services, then that list goes to 
                                                  # the "Where-Object cmdlet for processing.
                                                  # $_ represents the current object in the pipeline (The Pipeline Variable).
                                                  # -match "y" filters results where the Name or DisplayName contains "y" 

Get-Process | Where-Object { $_.CPU -gt 100 } | Out-GridView     # This will show you processes with a CPU usage greater than 100

# This isn't the same as the COMMAND SEPARATOR ;  The semicolon is used when you want to run commands SEQUENTIALLY
Get-Process; Get-Service; Get-EventLog -LogName Security   # This will run these commands one after the other. 
