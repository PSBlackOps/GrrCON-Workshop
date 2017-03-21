## Integer Variable
$TestVar1 = 1
$TestVar1.GetType()

## Floating Point Variable (Double)
$TestVar2 = 3.14
$TestVar2.GetType()

## String Variable
$TestVar3 = "Hello, world."
$TestVar3.GetType()

## Another Way to use variables
New-Variable -Name TestVar4 -Value (Get-Date)
$TestVar4.GetType()


