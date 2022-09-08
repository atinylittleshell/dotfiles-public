oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt.omp.json" | Invoke-Expression

$env:AZ_ENABLED=$false

Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine

$lvim_bin = "$HOME\.local\bin\lvim.ps1"
Set-Alias lvim $lvim_bin
