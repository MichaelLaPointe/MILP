# Path to the Profile for Current User/Current Host

$profile

# Paths to ALL the Profiles
# PowerShell 5.1 is slightly different than later versions. 

$profile | Get-Member -MemberType NoteProperty | fl

#    Profiles are loaded in the following order (if it exists), 
#    with each consecutive one overriding settings of the one loaded before it. 
#         All Users, All Hosts
#         All Users, Current Host
#         Current User, All Hosts
#         Current User, Current Host