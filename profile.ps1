$env:AZ_ENABLED=$false
Set-PoshPrompt -Theme emodipt

Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine

$lvim_bin = "$HOME\.local\bin\lvim.ps1"
Set-Alias lvim $lvim_bin
