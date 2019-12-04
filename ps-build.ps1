function New-HardLink() {
    Param ([string]$link, [string]$target)
    if (Test-Path $link) {
        Write-Error "Error: $link already exists"
    } else {
        New-Item -ItemType HardLink -Path $link -Target $Target
    }
}


New-HardLink  $PROFILE.CurrentUserCurrentHost ".\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

New-HardLink $PROFILE.CurrentUserAllHosts ".\WindowsPowerShell\profile.ps1"

$path_run = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run'

# Set-Itemproperty -path $path_run -Name 'Notepad' -value 'c:\windows\notepad.exe'

$path_hotkeys = Resolve-Path '.\scripts\hotkeys.ahk'
Set-Itemproperty -path $path_run -Name "Will's Hotkeys" -value """$path_hotkeys"""

$path_hotstrings = Resolve-Path '.\scripts\hotstrings.ahk'
Set-Itemproperty -path $path_run -Name "Will's Hotstrings" -value """$path_hotstrings"""

