######     VARIABLES

## Variables start with a dollar sign in Powershell. Spaces are not allowed. Case doesn't matter. Make your variables MEANINGFUL

## Cases 
            # Camel Case - The first letter of the first word is lowercase, and the first letter of each subsequent word is capitalized
            # Pascal Case - Similar to camel case, but the first letter of the first word is also capitalized.
            # Snake Case - Uses underscores to separate words.

$name = "Mike"            # Powershell knows this is a "String"
$milesFromDallas = 900    # Powershell knows this is "Number"
$IsLearning = $true       # Powershell knows this is a "Boolean"

cls ; Write-Host "Hello, my name is $Name and I live about $milesFromDallas miles from Dallas."

$milesFromDallas = $milesFromDallas + 10    # You can change vartiables in your script

cls ; Write-Host "If I drive ten miles in the other direction, I will be $milesFromDallas miless from Dallas."

# Variables can hold more than one value

$Colors = @("Red", "Blue", "Green")
$Colors[1]  # This will show 'Blue' --- What? Why doesn't it show Red? Array Indexes.
            # PowerShell starts counting at 0, and you can also use negative indexing to count from the end.
$Colors     # Shows all the elements in the array.

Get-Help about_Variables