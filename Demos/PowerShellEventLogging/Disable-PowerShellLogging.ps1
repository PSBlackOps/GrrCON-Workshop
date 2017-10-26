<#
    Removes the PowerShell logging settings from the registry.
#> 

$PSLoggingRegRoot = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell'
Remove-Item -Path $PSLoggingRegRoot -Recurse -Force