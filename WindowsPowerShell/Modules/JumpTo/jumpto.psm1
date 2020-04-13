Write-Output "Loading JumpTo"

$default_jumpto_database = "~\config\jumpto.txt"

$jumpto_database = if ($jumpto_database -eq $null) {
    $default_jumpto_database
} else {
    $jumpto_database
}

if (!(Test-Path $jumpto_database)) {
    Write-Warning "JumpTo database not found, creating: $jumpto_database"
    New-Item -ItemType File -Path $jumpto_database
}

function Get-LocationAliases {
    $db = Get-Content $jumpto_database | ConvertFrom-Csv -Delimiter ";" -Header "Alias", "Target"
    return $db
}

function Set-LocationByAlias() {
    $needle = $args -join "-"
    $target = (Get-LocationAliases | ? {$_.Alias -eq $needle} | Select-Object -first 1).Target
    if ($target -eq $null) {
        Write-Warning "Error; no alias: $needle"
    } elseif (Test-Path -Path $target) {
        Push-Location $target
    } else {
        Write-Warning "Error: $target doesn't exist"
    }
}

function Add-LocationAlias {
    $needle = $args -join "-"
    $pwd = (Get-Location).Path

    if ($needle -eq "") {
        $lhs = $pwd | Split-Path -leaf
    } else {
        $lhs = $needle
    }

    $db = Get-LocationAliases

    $alias_already_exists = $db.Alias.Contains($lhs)

    if ($alias_already_exists) {
        Write-Warning "Alias already exists: $lhs"
    } else {
        $line = $lhs + ";" + $pwd
        Write-Output "Adding:"
        Write-Output $line
        Add-Content $jumpto_database $line
    }
}

function Edit-LocationAliases {
    ii $jumpto_database
}



Export-ModuleMember -Function Set-LocationByAlias
Export-ModuleMember -Function Add-LocationAlias
Export-ModuleMember -Function Edit-LocationAliases
Export-ModuleMember -Function Get-LocationAliases

