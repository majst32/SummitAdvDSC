[DSCLocalConfigurationManager()]

Configuration LCMTug {
    Node TgtPull {
        
        Settings {
            ConfigurationMode = 'ApplyOnly'
            RefreshMode = 'Pull'
            ActionAfterReboot = 'ContinueConfiguration'
            }
        
        ConfigurationRepositoryWeb Tug {
            ServerURL = 'http://tug.company.pri:5000'
            AllowUnsecureConnection = $True
            RegistrationKey = '6f923f3c-0588-4105-b448-ae6ac219853a'
            #Get-Content '\\tug\C$\Program Files\Tug\Server\var\DscService\Authz\RegistrationKeys.txt'
            ConfigurationNames = 'TimeZoneConfig'
            }
        }
    }
LCMTug -OutputPath 'C:\DSC\LCM'


