# Get a Command - (almost) any command.
# This works on PowerShell commands, as well as installed programs IN YOUR PATH

# PowerShell Get-Command
Get-Command -Name '*process*'

# Installed program Get-Command (Not in path)
Get-Command -Name 'diablo*'

# Installed program Get-Command (In Path)
Get-Command -Name 'nmap'

# Let's add Diablo to the path
$env:Path = "${env:Path};C:\Program Files (x86)\Diablo III"
Get-Command -Name 'diablo*'

# Get help on Get-Process
Get-Help Get-Process

# Help isn't installed locally - this is actually a good thing
# online help means it doesn't get as outdated. You can download
# help and install it for machines that don't have a solic internet
# connection. In this case, we'll just look online.
Get-Help Get-Process -Online

# Ok, so let's get a process
Get-Process lsass

# Well that's not much information. What else is there to a process
# object that PowerShell isn't showing us?
Get-Process lsass | Get-Member

# That's a lot of stuff. We can look at one (or more!) of those things
# by using Select-Object
Get-Process lsass | Select-Object WorkingSet