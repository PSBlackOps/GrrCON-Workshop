## Integer Variable
$TestVar1 = 1
$TestVar1.GetType().FullName

## Floating Point Variable (Double)
$TestVar2 = 3.14
$TestVar2.GetType().FullName

## String Variable
$TestVar3 = 'Hello, world.'
$TestVar3.GetType().FullName

## Another Way to use variables
New-Variable -Name TestVar4 -Value (Get-Date)
$TestVar4.GetType().FullName

## Testing to see if variable exists
Test-Path -Path Variable:TestVar4

## Type Constrained Varible
[int]$TestVar5 = 12
[string]$TestVar6 = 'Matt'
[string]$TestVar7 = 12

## Other ways to make variables. Not normal but it works.
${Test Var 8}=100
Write-Host ${Test Var 8}

## Constant / Read Only Variable
$TestVar9 = 'Machine'
Set-Variable -Name TestVar9 -Option ReadOnly
$TestVar9 = 'NewMachine'