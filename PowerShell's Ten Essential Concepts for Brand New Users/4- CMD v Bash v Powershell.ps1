#######    PowerShell vs CMD vs Bash

## CLI - Command Line Interface. Used to interact with the OS via text-based commands

## Powershell - Modern Windows Shell, Uses Objects, Full Scripting, Cross platform, pipline passes objects
## CMD - Legacy Windows Shell, plain text only, basic batch scripting, Windows only. pipeline passes text
## Bash - Linux/Mac, Mostly text based, Advanced scripting, Cross platform (WSL), pipeline passes text

dir  # CMD command. Returns text in Command Prompt
ls   # Bash command. Almost always returns text in Bash.
Get-ChildItem  # Powershell cmdlet. Returns OBJECTS

# Because we are running aliases for "Get-ChildItem above, we get Objects every time.

# ALMOST all CMD commands can be used in Powershell, but not all. (ver, title, call, etc)
# If you NEED to run a CMD command, just enter CMD right in Powershell

cmd /c "title Death Star Console"