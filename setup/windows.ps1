if ($PSVersionTable.PSVersion.Major -lt 7) {
  Write-Warning "This script requires PowerShell 7 or higher."
  return
}

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $false) {
  Write-Warning "This script must be run as an administrator."
  return
}

if ((Test-Path $profile) -and ((Get-Item $profile).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing profile: $profile"
  Remote-Item -Force $profile
}
New-Item -Force -ItemType SymbolicLink -Path $profile -Target (Join-Path -Path $PSScriptRoot -ChildPath "profile.ps1")

$t1Link = Join-Path -Path $env:USERPROFILE -ChildPath ".config\TerminalOne"
if ((Test-Path $t1Link) -and ((Get-Item $t1Link).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing TerminalOne directory: $t1Link"
  Remove-Item -Force -Recurse $t1Link
}
New-Item -Force -ItemType SymbolicLink -Path $t1Link -Target (Join-Path -Path $PSScriptRoot -ChildPath "..\home-manager\files\.config\TerminalOne")

$nvimLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
if ((Test-Path $nvimLink) -and ((Get-Item $nvimLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing nvim directory: $nvimLink"
  Remove-Item -Force -Recurse $nvimLink
}
New-Item -Force -ItemType SymbolicLink -Path $nvimLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "..\home-manager\files\.config\nvim")

$starshipLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "starship.toml"
if ((Test-Path $starshipLink) -and ((Get-Item $starshipLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing starship config: $starshipLink"
  Remove-Item -Force -Recurse $starshipLink
}
New-Item -Force -ItemType SymbolicLink -Path $starshipLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "..\home-manager\files\.config\starship.toml")

choco install fd -y
choco install ripgrep -y
choco install neovim -y
choco install starship -y