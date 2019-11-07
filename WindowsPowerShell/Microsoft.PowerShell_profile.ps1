Write-Output "Current user, Current Host"
Write-Output "Hello from my profile!"

Import-Module JumpTo

function Open-CurrentDirectory {
    ii .
}

function Exit-Powershell {
    exit
}

set-alias l ls
set-alias q Exit-Powershell
set-alias :q Exit-Powershell
set-alias e Open-CurrentDirectory
set-alias v vim


set-alias j Set-LocationByAlias
set-alias ja Add-LocationAlias
set-alias je Edit-LocationAliases
set-alias jls Get-LocationAliases

function gs {
    git status
}

