$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = '*'
           }
      
     @{
            NodeName = 'Auth'
            Name = 'SummitTest'
            Path = 'C:\Github\SummitAdvDSC'
        }
    )
}

Configuration Share {
    Node $AllNodes.NodeName {
        
        script Share {
            TestScript = {
                try {
                    $Share = Get-SmbShare -name $Using:Node.Name -ErrorAction Stop
                    if ($Share.Path -eq $Using:Node.Path) {$Result = $True}
                    else {$Result = $False}
                    }
                catch {$Result = $false}
                $Result
                }
            SetScript = {
                try {
                    $Share = Get-SMBShare -Name $Using:Node.Name -ErrorAction Stop
                    Remove-SmbShare -name $Using:Node.Name -force
                    New-SMBShare -name $Using:Node.Name -path $Using:Node.Path
                    }
                catch {
                    New-SmbShare -Name $Using:Node.Name -Path $Using:Node.Path
                    }
                }
            GetScript = {
                $Share = get-SMBShare -name $Using:Node.Name -ErrorAction SilentlyContinue
                $Result = @{Name = $Share.Name
                            Path = $Share.Path
                            Ensure = if ($Share) {"Present"} else {"Absent"}
                            }
                $Result
                }
            } #Script Resource
        } #Node
    }#Config

Share -ConfigurationData $ConfigData -OutputPath C:\DSC\Configs



                