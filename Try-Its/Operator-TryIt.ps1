# Number 1
$name = 'Matt'
if ($name -eq 'Chris') {
    Write-Host 'The value is Chris'
} else {
    Write-Host "The value is not Chris. It is $name"
}

# Number 2
$Value = Read-Host -Prompt 'Enter a number'
if ($Value -lt 10) {
    Write-Host "Value is less than 10"
}

# Number 3
$string = "The dog is amazing."
$value = Read-Host -Prompt "Enter the string to search for"
if ($string -match $value) {
    Write-Host "$value is in the string."
}