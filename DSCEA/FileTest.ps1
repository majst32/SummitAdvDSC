Configuration FileTest {
    
    param (
        [string[]]$ComputerName
        )

    Node $ComputerName {
        
        file TempDir {
            Ensure = 'present'
            Type = 'Directory'
            DestinationPath = "C:\temp"
            }
        }
    }
FileTest -ComputerName Cli1,TgtPull -outputPath C:\DSC\Configs
        