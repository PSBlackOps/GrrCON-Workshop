<#
    The following commands will create the global profile and write the
    command Start-Process notepad.exe to it.

    This will cause notepad to be launched any time powershell.exe is
    loaded (unless the -NoProfile switch is used with powershell.exe)
#>
$ProfilePath = 'C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1'
New-Item $ProfilePath -ItemType File
Set-Content -Path $ProfilePath -Value 'Start-Process notepad.exe'


# The command below removes the system profile
Remove-Item $ProfilePath -Force