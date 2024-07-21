Import-Module PSReadLine

Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[90m" }
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine

$ENV:STARSHIP_CONFIG = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "starship.toml")
Invoke-Expression (&starship init powershell)