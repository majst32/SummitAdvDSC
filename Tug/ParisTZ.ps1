Configuration ParisTZ {
    Import-DscResource -ModuleName PSDesiredStateConfiguration,
        @{ModuleName='xTimeZone';ModuleVersion='1.6.0.0'}

    Node TimeZoneConfig {
        
        xTimeZone ParisTZ {
            TimeZone = 'Central Europe Standard Time'
            IsSingleInstance = 'Yes'
            }
        }
    }

ParisTZ -outputPath "C:\DSC\Configs"       
        