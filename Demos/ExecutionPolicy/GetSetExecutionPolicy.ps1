<#
    Helps to illustrate getting and setting execution policies. Also demonstrates
    how to bypass execution policy in order to reinforce the idea that execution
    policy is not a security boundary.
    
    View Execution Policy for the:
    1. Current user
    2. Local machine
    3. All scopes
    
    Set Execution Policy for the:
    1. Current process
    2. Current user
    3. LocalMachine
#>
# View the execution policy for the current user/scope
Get-ExecutionPolicy

# View the execution policy for a specific scope
Get-ExecutionPolicy -Scope LocalMachine

# List the execution policy for all defined scopes
Get-ExecutionPolicy -List

# Set execution policy for current process
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
Get-ExecutionPolicy -Scope Process

# Set execution policy for current user
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
Get-ExecutionPolicy -Scope CurrentUser

# Set execution policy for local machine
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force
Get-ExecutionPolicy -Scope LocalMachine
