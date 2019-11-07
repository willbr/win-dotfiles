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

New-Item -ItemType SymbolicLink -Path "$Home\Documents\WindowsPowerShell\Modules" -Target ".\WindowsPowerShell\Modules"
