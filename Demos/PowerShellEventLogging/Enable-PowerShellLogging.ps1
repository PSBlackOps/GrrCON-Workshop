<#
.SYNOPSIS
    Enables PowerShell Module and Script-Block logging.
.DESCRIPTION
    Modifies the registry keys needed for enabling PowerShell logging
    for all modules and script blocks.

    This is normally enabled via GPO, but for the purposes of this
    workshop, we'll enable it with registry edits (weeeeee!)


    Module logging
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging → EnableModuleLogging = 1
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames → * = *

    Scriptblock logging
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging → EnableScriptBlockLogging = 1

    Configure transcripts
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription → EnableTranscripting = 1
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription → EnableInvocationHeader = 1
    HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\Transcription → OutputDirectory = "" (Enter path. Empty = default)
#>

# Setup some variables
$PSLoggingRegRoot       = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Policies\Microsoft\Windows\PowerShell'
$ModuleLoggingRoot      = (Join-Path $PSLoggingRegRoot 'ModuleLogging')
$ModulesToLog           = (Join-Path $ModuleLoggingRoot 'ModuleNames')
$ScriptBlockLoggingRoot = (Join-Path $PSLoggingRegRoot 'ScriptBlockLogging')
$TranscriptLoggingRoot  = (Join-Path $PSLoggingRegRoot 'Transcription')

#region Module logging
# Create the subkeys if they don't already exist
If ((Test-Path $ModuleLoggingRoot) -eq $false) {
    # Create the ModuleLogging subdirectory
    New-Item -Path $ModuleLoggingRoot -Force

    # Create the ModuleNames subdirectory
    New-Item -Path $ModulesToLog -Force
}

# Create (-force) and set the EnableModuleLogging key
Set-ItemProperty -Path $ModuleLoggingRoot -Name EnableModuleLogging -Value 1 -Force

# Configure module logging to log all modules
Set-ItemProperty -Path $ModulesToLog -Name '*' -Value '*' -Force
#endregion

#region Scriptblock logging
# Create the subkeys if they don't exist
if ((Test-Path $ScriptBlockLoggingRoot) -eq $false) {
    # Create the ScriptBlockLogging subdirectory
    New-Item -Path $ScriptBlockLoggingRoot -Force
}

# Create (-force) and set the EnableScriptBlockLogging key
Set-ItemProperty -Path $ScriptBlockLoggingRoot -Name EnableScriptBlockLogging -Value 1 -Force
#endregion

#region Transcript logging
if (-not(Test-Path $TranscriptLoggingRoot)) {
    # Create the Transcription subdirectory
    New-Item -Path $TranscriptLoggingRoot -Force
}

# Create (-force) and set transcription settings 
Set-ItemProperty -Path $TranscriptLoggingRoot -Name EnableTranscripting -Value 1 -Force
Set-ItemProperty -Path $TranscriptLoggingRoot -Name EnableInvocationHeader -Value 1
Set-ItemProperty -Path $TranscriptLoggingRoot -Name OutputDirectory -Value 'C:\ps\transcripts'
#endregion