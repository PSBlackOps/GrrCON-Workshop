# write an error message
Write-Error 'This is a non-terminating error.'

# throw an error message
throw "This is a terminating error."

# a Try/Catch that outputs 'Woops! An error occurred.'
try {
    throw 'bad things happened'
} catch {
    Write-Host 'Woops! An error occurred.'
}

# and a Try/Catch/Finally block
# the line 1..5 is a shortcur for "Do this 5 times"
# $PSItem means "the thing I'm working on right now"
# The code below will throw a terminating error when it gets to
# 3, it will never print 3, 4, or 5
try {
    1..5 | Foreach-Object { 
                if ($PSItem -eq 3) { 
                    throw "Error number: $($PSItem)"
                } else {
                    $PSItem
                }
            }
} catch {
    Write-Host $PSItem
} finally {
    'All done!'
}