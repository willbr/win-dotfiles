Write-Output "Current user, Current Host"
Write-Output "Hello from my profile!"

Import-Module JumpTo

function Open-CurrentDirectory {
    Invoke-Item .
}

function Exit-Powershell {
    exit
}

set-alias l ls
set-alias q Exit-Powershell
set-alias :q Exit-Powershell
set-alias e Open-CurrentDirectory

if (Get-Command nvim -ErrorAction SilentlyContinue) {
    set-alias v nvim
} elseif (Get-Command vim -ErrorAction SilentlyContinue) {
    set-alias v vim
}


set-alias j Set-LocationByAlias
set-alias ja Add-LocationAlias
set-alias je Edit-LocationAliases
set-alias jls Get-LocationAliases

function gs {
    git status
}

function Set-TodaysJournal {
    $path_journal = $env:JOURNAL_DIR

    if (-Not $path_journal) {
        $path_journal = "~\Documents\Journal"
    }

    if (-Not (Test-Path -Path $path_journal)) {
        New-Item -ItemType Directory $path_journal | Out-Null
    }

    $path_year = Join-Path $path_journal (Get-Date).Year

    $basename = "$(Get-Date -Format "yyyy_MM_dd").md"
    $path_today = Join-Path $path_year $basename

    if (-Not (Test-Path -Path $path_year)) {
        New-Item -ItemType Directory $path_year | Out-Null
    }

    $path_template = Join-Path $path_journal "template.md"


    if (Test-Path -Path $path_today -PathType leaf) {
        Invoke-Item $path_today
        return
    }

    if (Test-Path -Path $path_template -PathType leaf) {
        Copy-Item $path_template $path_today
    } else {
        New-Item -Path $path_today -ItemType "file" | Out-Null
    }

    Invoke-Item $path_today
}

set-alias jrnl Set-TodaysJournal

switch ( $env:computername ) {
	"surface-laptop" {
		New-Alias ctoy "c:\tools\ctoy\ctoy.exe"
		write-output "laptop"
		break
	}

	default {
		write-output "default"
		break
	}
}

