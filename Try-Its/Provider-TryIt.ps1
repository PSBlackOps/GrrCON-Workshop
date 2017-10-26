# Create a new function
New-Item -Path function: -Name New-Insult -Value { Write-Host 'You crooked-nosed Knave!' }

# Call your new function!
New-Insult

# Rename the function - first way
Rename-Item -Path function:\New-Insult -NewName Old-Insult

# Rename the function - second way
Get-Item -Path function:\Old-Insult | Rename-Item -NewName New-Insult

# Create a new envrionment variable named USERROLE and a value of Student
New-Item -Path env: -Name USERROLE -Value 'Student'

# Change the value of USERROLE to Administrator
Set-Item -Path env:USERROLE -Value 'Administrator'

# Output the value of the USERROLE variable - first way
Get-Item -Path env:USERROLE

# Output the value of the USERROLE variable - second way
Write-Host $env:USERROLE

# Bonus #1 Append ‘C:\ps’ to the env:Path variable
Set-Item -Path Env:\Path -Value "$env:Path;C:\ps"

# Output the value of env:\Path
Get-Item -Path env:\Path | Select-Object -ExpandProperty Value


# Bonus #2: Create a new Registry key in the HKCU drive named 
# Student. Add an Item to HKCU:\Student with a name of “Name” 
# and a Value of your name
New-Item -Path HKCU: -Name 'Student'

# The registry provider provides access to the *-ItemProperty
# commands which are used for interacting with registry items
New-ItemProperty -Path HKCU:\Student -Name 'Name' -Value 'Your name'

# Output the item property you just created
Get-Item -Path HKCU:\Student -Name 'Name'
