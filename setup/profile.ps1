Import-Module PSReadLine

Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[90m" }
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function RevertLine

function Cd-Parent {
  cd ..
}

function Git-Switch-Main {
  git switch main
}

function Git-Switch-Master {
  git switch master
}

function Git-Pull {
  git pull
}

function Git-Push {
  git push
}

function Git-Add-All {
  git add .
}

function Git-Amend {
  git commit --amend
}

Set-Alias -Name ".." -Value Cd-Parent
Set-Alias -Name m -Value Git-Switch-Main
Set-Alias -Name mst -Value Git-Switch-Master
Set-Alias -Name pull -Value Git-Pull
Set-Alias -Name push -Value Git-Push
Set-Alias -Name add -Value Git-Add-All
Set-Alias -Name amend -Value Git-Amend

$ENV:STARSHIP_CONFIG = (Join-Path -Path $env:LOCALAPPDATA -ChildPath "starship.toml")
Invoke-Expression (&starship init powershell)
