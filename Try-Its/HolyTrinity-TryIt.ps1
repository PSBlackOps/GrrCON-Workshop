# Get a Command - (almost) any command.
# This works on PowerShell commands, as well as installed 
# programs IN YOUR PATH

# PowerShell Get-Command
Get-Command -Name '*process*'

# Installed program Get-Command (In Path)
Get-Command -Name 'ipconfig'

# Installed program Get-Command (Not in path)
Get-Command -Name 'psexec'

# Let's add psexec to the path then try to get the command again
$env:Path = "${env:Path};C:\Tools"
Get-Command -Name 'psexec'

# Get help on Get-Process
Get-Help Get-Process

# Help isn't installed locally - this is usually a good thing
# online help means it doesn't get as outdated. To finish the
# rest of the try-it, install help locally. It's already
# been downloaded for you and placed in the c:\ps\pshelp folder
Update-Help -SourcePath c:\ps\pshelp

# Now try to get help about Get-Process
Get-Help Get-Process

# Get-Help also accepts parameters, get the help information for
# Get-Help
help Get-Help

# Ok, so let's get a process
Get-Process lsass

# Well that's not much information. What else is there to a process
# object that PowerShell isn't showing us?
Get-Process lsass | Get-Member

# That's a lot of stuff. We can look at one (or more!) of those things
# by using Select-Object
Get-Process lsass | Select-Object WorkingSet