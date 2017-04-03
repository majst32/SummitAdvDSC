Configuration DSCEATest {
    Node TgtPull {
        
        File Outline {
            SourcePath = "\\Auth\C`$\Github\SummitAdvDSC\Outline.ps1"
            DestinationPath = "C:\Temp"
            Ensure = "Present"
            }
        }
    }
DSCEATest -OutputPath C:\DSC\Configs
