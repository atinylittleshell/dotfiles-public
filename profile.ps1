Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt.omp.json" | Invoke-Expression
