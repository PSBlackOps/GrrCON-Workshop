# Number 1
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property Name

# Number 2
Start-Process 'notepad.exe'
$Notepad = Get-CimInstance -ClassName Win32_Process -Filter "Name = 'notepad.exe'"
Invoke-CimMethod -InputObject $Notepad -MethodName Terminate

