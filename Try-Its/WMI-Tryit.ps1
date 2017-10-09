# Number 1
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property Name

# Number 2
Start-Process 'notepad.exe'
$Notepad = Get-CimInstance -ClassName Win32_Process -Filter "Name = 'notepad.exe'"
Invoke-CimMethod -InputObject $Notepad -MethodName Terminate

# Number 3
(Get-CimClass -ClassName Win32_Process).CimClassMethods

# Number 4
$Arguments = @{
    CommandLine = 'notepad.exe';
    CurrentDirectory = $null;
    ProcessStartupInformation = $null
}
Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments $Arguments