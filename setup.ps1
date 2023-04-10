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

$nvimLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
if ((Test-Path $nvimLink) -and ((Get-Item $nvimLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing nvim directory: $nvimLink"
  Remove-Item -Force -Recurse $nvimLink
}
New-Item -Force -ItemType SymbolicLink -Path $nvimLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "nvim")

$starshipLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "starship.toml"
if ((Test-Path $starshipLink) -and ((Get-Item $starshipLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing starship config: $starshipLink"
  Remove-Item -Force -Recurse $starshipLink
}
New-Item -Force -ItemType SymbolicLink -Path $starshipLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "starship.toml")

$weztermLink = Join-Path -Path $HOME -ChildPath ".wezterm.lua"
if ((Test-Path $weztermLink) -and ((Get-Item $profile).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing wezterm config: $weztermLink"
  Remote-Item -Force $weztermLink
}
New-Item -Force -ItemType SymbolicLink -Path $weztermLink -Target (Join-Path -Path $PSScriptRoot -ChildPath ".wezterm.lua")

choco install wezterm -y
choco install fd -y
choco install ripgrep -y
choco install starship -y
