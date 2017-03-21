$ConfigData = @{
    AllNodes = @(
        @{
            NodeName = '*'
           }
      
     @{
            NodeName = 'DC1'
            CACN = 'CompanyRoot'
            DomainDN = 'DC=Company,DC=Pri'
        }
    )
}
  
Configuration DoSomething {
    
    Node $AllNodes.NodeName {

        Script doSomething {
                TestScript = {
                    try {
                        #Get-ADObject -Identity "CN=CompanyRoot,CN=Certification Authorities,CN=Public Key Services,CN=Services,CN=Configuration,DC=Company,DC=Pri"
                        #Get-ADObject -Identity "CN=$Using:Node.CACN,CN=CertificationAuthorities,CN=PublicKeyServices,CN=Services,CN=Configuration,$Using:Node.DomainDN"
                        $CACN = $Using:Node.CACN
                        Write-Verbose "Checking for $CACN"
                        Get-ADObject -Identity "CN=$CACN,CN=CertificationAuthorities,CN=PublicKeyServices,CN=Services,CN=Configuration,$Using:Node.DomainDN"
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
