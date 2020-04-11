function New-HardLink() {
    Param ([string]$link, [string]$target)
    if (Test-Path $link) {
        Write-Host -ForegroundColor Red "Error: $link already exists"
    } else {
        New-Item -ItemType HardLink -Path $link -Target $Target
    }
}

function New-SymbolicLink() {
    Param ([string]$link, [string]$target)
    if (Test-Path $link) {
        Write-Host -ForegroundColor Red "Error: $link already exists"
    } else {
        New-Item -ItemType SymbolicLink -Path $path_vim -Target ".\vimfiles"
    }
}

function Create-Missing-Directory() {
    Param ([string]$path)
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path
    }
}

$path_profile = (Get-Item $PROFILE.CurrentUserCurrentHost).Directory.FullName

Create-Missing-Directory $path_profile


New-HardLink  $PROFILE.CurrentUserCurrentHost ".\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

$path_vim = Resolve-Path "~\vimfiles"
New-SymbolicLink $path_vim ".\vimfiles"

New-HardLink $PROFILE.CurrentUserAllHosts ".\WindowsPowerShell\profile.ps1"


$path_modules = (Join-Path $path_profile "Modules")
New-SymbolicLink $path_modules ".\WindowsPowerShell\Modules"

$path_run = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run'

$path_hotkeys = Resolve-Path '.\scripts\hotkeys.ahk'
Set-Itemproperty -path $path_run -Name "Will's Hotkeys" -value """$path_hotkeys"""

$path_hotstrings = Resolve-Path '.\scripts\hotstrings.ahk'
Set-Itemproperty -path $path_run -Name "Will's Hotstrings" -value """$path_hotstrings"""

