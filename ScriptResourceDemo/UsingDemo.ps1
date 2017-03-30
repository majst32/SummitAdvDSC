$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = '*'
            CN = "CompanyRoot"
            DomainDN = "DC=company,DC=pri"
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
                        Get-ADObject -Identity "CN=$Using:Node.CN,CN=Certification Authorities,CN=Public Key Services,CN=Services,CN=Configuration,DC=$Using:Node.DomainDN"
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
                    Return @{Result = (Get-ADObject -Identity "CN=$Using:Node.CN,CN=Certification Authorities,CN=Public Key Services,CN=Services,CN=Configuration,$Using:Node.DomainDN").Name}
                    }
                }
        }
    }
DoSomething -ConfigurationData $ConfigData -OutputPath C:\DSC\Configs
