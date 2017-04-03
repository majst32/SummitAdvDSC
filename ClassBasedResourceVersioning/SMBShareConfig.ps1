Configuration SMBShareTest {
    Import-DscResource -ModuleName SMBShareClass -ModuleVersion 1.0.0.0

    Node tgtpull {

        SMBShareClass Modules {
           Name = "Modules"
           Path = "C:\Program Files\WindowsPowerShell\Modules"
           Ensure = "Present"
           }
    }
}
SMBShareTest
