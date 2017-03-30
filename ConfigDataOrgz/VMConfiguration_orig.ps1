Configuration AutoLab {

$LabData = Import-PowerShellDataFile -Path .\ConfigDataOrgz\VMConfigurationData.psd1
$Secure = ConvertTo-SecureString -String "$($labdata.allnodes.labpassword)" -AsPlainText -Force 
$credential = New-Object -typename Pscredential -ArgumentList Administrator, $secure 

#region DSC Resources
    Import-DSCresource -ModuleName PSDesiredStateConfiguration,
        @{ModuleName="xPSDesiredStateConfiguration";ModuleVersion="5.0.0.0"},
        @{ModuleName="xActiveDirectory";ModuleVersion="2.14.0.0"},
        @{ModuleName="xComputerManagement";ModuleVersion="1.8.0.0"},
        @{ModuleName="xNetworking";ModuleVersion="3.0.0.0"},
        @{ModuleName="xDhcpServer";ModuleVersion="1.5.0.0"},
        @{ModuleName='xWindowsUpdate';ModuleVersion = '2.5.0.0'},
        @{ModuleName='xPendingReboot';ModuleVersion = '0.3.0.0'},
        @{ModuleName='xADCSDeployment';ModuleVersion = '1.0.0.0'}

#endregion

#region Domain Controller config

    node $AllNodes.Where({$_.Role -eq 'DC'}).NodeName {

    $DomainCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ("$($Node.DomainName)\$($Credential.UserName)", $Credential.Password)

            xADDomain FirstDC {
                DomainName = $Node.DomainName
                DomainAdministratorCredential = $Credential
                SafemodeAdministratorPassword = $Credential
                DatabasePath = $Node.DCDatabasePath
                LogPath = $Node.DCLogPath
                SysvolPath = $Node.SysvolPath 
            }  

                         
    } #end DC

} # Edn Config
#endregion

AutoLab -OutputPath C:\DSC\Configs -ConfigurationData .\ConfigDataOrgz\VMConfigurationData.psd1

