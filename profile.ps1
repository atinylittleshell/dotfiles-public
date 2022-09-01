$env:AZ_ENABLED=$false
Set-PoshPrompt -Theme emodipt

Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine
