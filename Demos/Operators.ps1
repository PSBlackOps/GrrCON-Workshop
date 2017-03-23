## Math Fun Time

3+4
4-3
12*2
12/2
13%2

## Assignment Fun Time
$x = 1
$x
$x += 2
$x
$x -= 1
$x
$x *= 10
$x
$x /= 2
$x
$x %= 3
$x

## Comparison Fun Time

'abc' -eq 'ABC'
True
'abc' -ieq 'ABC'
True
'abc' -ceq 'ABC'
False

## Using Objects for comparision
[DateTime]'1/1/2015' -gt (Get-Process powershell*)[0].StartTime
Get-Process | Where-Object {$_.starttime -ge [DateTime]::today}
