if ($PSVersionTable.PSVersion.Major -lt 7) {
  Write-Warning "This script requires PowerShell 7 or higher."
  return
}

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $false) {
  Write-Warning "This script must be run as an administrator."
  return
}

function Install-Program-If-Needed {
    param (
        [string]$CommandName,
        [string]$InstallCommand
    )

    if (-not (Get-Command $CommandName -ErrorAction SilentlyContinue)) {
        if ($InstallCommand) {
            Write-Host "Running install command: $InstallCommand"
            Invoke-Expression $InstallCommand
        }
    } else {
        Write-Host "$CommandName is already available. Skip installing."
    }
}

function Ensure-Symlink {
    param (
        [string]$Link,
        [string]$Target
    )

    if ((Test-Path $Link) -and ((Get-Item $Link).LinkType -ne "SymbolicLink")) {
      Write-Warning "Deleting existing path: $Link"
      Remove-Item -Force -Recurse $Link
    }
    New-Item -Force -ItemType SymbolicLink -Path $Link -Target (Join-Path -Path $PSScriptRoot -ChildPath $Target)
}

Ensure-Symlink -Link $profile -Target "profile.ps1"
Ensure-Symlink -Link (Join-Path -Path $env:USERPROFILE -ChildPath ".config\TerminalOne") -Target "..\home-manager\files\.config\TerminalOne"
Ensure-Symlink -Link (Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim") -Target "..\home-manager\files\.config\nvim"
Ensure-Symlink -Link (Join-Path -Path $env:LOCALAPPDATA -ChildPath "starship.toml") -Target "..\home-manager\files\.config\starship.toml"

Install-Program-If-Needed -CommandName "scoop" -InstallCommand "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
scoop bucket add extras

# Development tools
Install-Program-If-Needed -CommandName "fd" -InstallCommand "scoop install fd"
Install-Program-If-Needed -CommandName "rg" -InstallCommand "scoop install ripgrep"
Install-Program-If-Needed -CommandName "nvim" -InstallCommand "scoop install extras/vcredist2022"
Install-Program-If-Needed -CommandName "nvim" -InstallCommand "scoop install neovim"
Install-Program-If-Needed -CommandName "starship" -InstallCommand "scoop install starship"
Install-Program-If-Needed -CommandName "ollama" -InstallCommand "scoop install ollama"

# Languages
Install-Program-If-Needed -CommandName "go" -InstallCommand "scoop install go"
Install-Program-If-Needed -CommandName "nvm" -InstallCommand "scoop install nvm"; nvm install lts; nvm use lts
Install-Program-If-Needed -CommandName "bun" -InstallCommand "scoop install bun"
Install-Program-If-Needed -CommandName "python" -InstallCommand "scoop install python"
Install-Program-If-Needed -CommandName "rustup" -InstallCommand "scoop install rust"; rustup default stable
