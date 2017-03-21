$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = '*'
           }
      
     @{
            NodeName = 'DC1'
        }
    )
}
  
Configuration DoSomething {
    
    Node $AllNodes.NodeName {

        Script doSomething {
                TestScript = {
                    try {
                        Get-ADObject -Identity "CN=CompanyRoot,CN=Certification Authorities,CN=Public Key Services,CN=Services,CN=Configuration,DC=Company,DC=Pri"
                        Return $True
                    }
                    Catch {
                        Return $False
                        }
                    }
                SetScript = {
                    do-something
                    }
                GetScript = {
                    Return @{Result = (Get-ADObject -Identity "CN=CompanyRoot,CN=Certification Authorities,CN=Public Key Services,CN=Services,CN=Configuration,DC=Company,DC=Pri").Name}
                    }
                }
        }
    }
DoSomething -ConfigurationData $ConfigData -OutputPath C:\DSC\Configs
