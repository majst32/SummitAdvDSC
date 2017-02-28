enum Ensure {
        Absent
        Present
        }

[DSCResource()]

Class SMBShareClass {
    [DSCProperty(Key)]
    [string]$Name

    [DSCProperty(Mandatory)]
    [string]$Path

    [DscProperty(Mandatory)]
    [Ensure]$Ensure


[bool] Test() {
    
   try {
        $Share = get-SMBShare -name $This.Name -ErrorAction Stop
        If (($This.Ensure -eq [Ensure]::Present) -and ($Share.Path -eq $This.path)) {return $True}
        else {return $False}
        }
   catch {
        if ($This.Ensure -eq [Ensure]::Absent) {return $True}
        else {return $False}
        }
    }

[void] Set() {
    if ($This.Ensure -eq [Ensure]::Absent) {
        remove-SMBShare -name $This.Name -Force
        }
    else {
        try {
            get-SMBShare -name $This.name -ErrorAction Stop
            remove-SMBShare -name $This.Name -Force
            new-SMBShare -Name $This.Name -Path $This.path
            }
        catch {
            new-SMBShare -name $This.Name -path $This.Path
            }
        }
    
    }

[SMBShareClass] Get() {
    $Share = get-smbshare -name $This.Name -ErrorAction SilentlyContinue
    if ($Share) {
        $This.Name = $Share.Name
        $This.Path = $Share.Path
        $This.Ensure = 'Present'
        }
    else {
        $This.Name = $null
        $This.Path = $Null
        $This.Ensure = 'Absent'
        }
    return $This
    }
}

       

