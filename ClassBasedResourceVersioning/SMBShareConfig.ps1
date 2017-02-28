Configuration SMBShareTest {
    Import-DscResource -ModuleName SMBShareClass -ModuleVersion 1.0.0.0

    Node localhost {

        SMBShareClass NNDTest {
           Name = "NNDTest"
           Path = "C:\Autolab\NNDTest"
           Ensure = "Present"
           }
    }
}
SMBShareTest
