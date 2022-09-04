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

$weztermLink = Join-Path -Path $HOME -ChildPath ".wezterm.lua"
if ((Test-Path $weztermLink) -and ((Get-Item $profile).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing wezterm config: $weztermLink"
  Remote-Item -Force $weztermLink
}
New-Item -Force -ItemType SymbolicLink -Path $weztermLink -Target (Join-Path -Path $PSScriptRoot -ChildPath ".wezterm.lua")

$lvimLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "lvim"
if ((Test-Path $lvimLink) -and ((Get-Item $lvimLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing lvim directory: $lvimLink"
  Remove-Item -Force -Recurse $lvimLink
}
New-Item -Force -ItemType SymbolicLink -Path $lvimLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "lvim")
