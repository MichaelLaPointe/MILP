######     OBJECTS

Get-Service   # You’re not just seeing text — you’re seeing objects with properties 
              # (Name, ID, and CPU usage) and methods (actions they can perform).

Get-Process | Get-Member    #  This tells you what an object has (properties) and what it can do (methods).

Get-Process | Sort-Object CPU -Descending  #  Want to sort them by the highest CPU usage? Sort by the CPU object.

#  Play around with Get-Member to see what objects are avaialble to you on different cmdlets

Get-Help about_Objects -Online