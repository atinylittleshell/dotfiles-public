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

$hyperLink = Join-Path -Path $env:APPDATA -ChildPath "Hyper\\.hyper.js"
if ((Test-Path $hyperLink) -and ((Get-Item $profile).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing hyper config: $hyperLink"
  Remote-Item -Force $hyperLink
}
New-Item -Force -ItemType SymbolicLink -Path $hyperLink -Target (Join-Path -Path $PSScriptRoot -ChildPath ".hyper.js")

$nvimLink = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim"
if ((Test-Path $nvimLink) -and ((Get-Item $nvimLink).LinkType -ne "SymbolicLink")) {
  Write-Warning "Deleting existing nvim directory: $nvimLink"
  Remove-Item -Force -Recurse $nvimLink
}
New-Item -Force -ItemType SymbolicLink -Path $nvimLink -Target (Join-Path -Path $PSScriptRoot -ChildPath "nvim")
