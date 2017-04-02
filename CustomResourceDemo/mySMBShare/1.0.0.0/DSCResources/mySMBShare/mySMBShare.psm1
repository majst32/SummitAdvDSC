function test-TargetResource {
    param (
    [parameter(Mandatory=$True)]
        [string] $Name,
    [parameter(Mandatory=$True)]
        [string] $Path,
     [ValidateSet("Absent","Present")] $Ensure='Present'
    )

    try {
        $Share = Get-SmbShare -name $Name -ErrorAction Stop
        if (($Share.Path -eq $Path) -and ($Ensure -eq 'Present')) {$Result = $True}
        else {$Result = $False}
    }
    catch {
        If ($Ensure -eq 'Absent') {$Result = $True}
        Else {$Result = $false}
    }
    $Result
}

function set-TargetResource {
     param (
    [parameter(Mandatory=$True)]
        [string] $Name,
    [parameter(Mandatory=$True)]
        [string] $Path,
     [ValidateSet("Absent","Present")] $Ensure='Present'
    )

if ($Ensure -eq 'Absent') {
    Remove-SmbShare -name $name -Force
    }
else {
    try {
        $Share = Get-SMBShare -Name $Name -ErrorAction Stop
        Remove-SmbShare -name $Name -force
        New-SMBShare -name $Name -path $Path
        }
    catch {
        New-SmbShare -Name $Name -Path $Path
        }
    }
}

function get-TargetResource {
    param (
        [parameter(Mandatory=$True)]
            [string] $Name,
        [parameter(Mandatory=$True)]
            [string] $Path
        )

$Share = get-SMBShare -name $Name -ErrorAction SilentlyContinue
$Result = @{Name = $Share.Name
            Path = $Share.Path
            Ensure = if ($Share) {"Present"} else {"Absent"}
            }
$Result
}



