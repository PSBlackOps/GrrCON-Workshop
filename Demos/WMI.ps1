# Get all WMI Classes that start with Win32_
Get-CimClass Win32_*

# Get info from win32_ComputerSystem
Get-CimInstance -ClassName Win32_ComputerSystem
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property Name, Domain

# WMI Associations
$disk = Get-CimInstance -class Win32_LogicalDisk -Filter ‘DriveType = 3’
$disk
Get-CimAssociatedInstance -CimInstance $disk

# What associations did we find?
Get-CimAssociatedInstance -CimInstance $disk | Get-Member
Get-CimAssociatedInstance -CimInstance $disk | Get-Member | Select-Object -Property TypeName
Get-CimAssociatedInstance -CimInstance $disk | Get-Member | Select-Object -Property TypeName -Unique

# Class Info
$Class = Get-CimClass -ClassName Win32_Process
# CIM Methods
$Class.CimClassMethods 
$Class.CimClassMethods['Create'].Parameters
Invoke-CimMethod -Class win32_process -MethodName Create -Argument @{CommandLine=’notepad.exe’; CurrentDirectory = "c:\windows\system32"}
$result = Invoke-CimMethod -Query ‘SELECT * FROM Win32_Process WHERE name like "notepad%"’ -MethodName GetOwner
$result

## Monitor WMI Service
## Boe Prox's Example @proxb
$Wmi = @{
    Query = "select * from __instanceModificationEvent within 5 where targetInstance isa 'win32_Service'"
    Action = {
        If ($Event.SourceEventArgs.NewEvent.PreviousInstance.State -ne $event.SourceEventArgs.NewEvent.TargetInstance.State) {
        $Global:Data = $Event
        Write-Host ("Service: {0}({1}) changed from {2} to {3}" -f $event.SourceEventArgs.NewEvent.TargetInstance.DisplayName,
                                                                        $event.SourceEventArgs.NewEvent.TargetInstance.Name,
                                                                        $event.SourceEventArgs.NewEvent.PreviousInstance.State,
                                                                        $event.SourceEventArgs.NewEvent.TargetInstance.State) -Back Black -Fore Green
        }
    }
    SourceIdentifier = "Service.Action"
}
$Null = Register-WMIEvent @Wmi

Stop-Service -InputObject wuauserv