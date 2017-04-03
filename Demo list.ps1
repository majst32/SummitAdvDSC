#Setup Environment needs:

######################################################################################
### DC with second disk for system state backups                                   ###
### Remove module "MySMBShare2" from Auth box                                      ###
### Clear C:\dsc\Configs and C:\DSC\LCM from Auth box                              ###
### Tug server                                                                     ###
### TgtTug (Tug Client)                                                            ###
######################################################################################

cd C:\Github\SummitAdvDSC

#Autolab

#Config Data
        ise ".\ConfigDataOrgz\VMConfigurationDataOrig.psd1"
        ise ".\ConfigDataOrgz\VMConfigurationData.psd1"
        ise ".\ConfigDataOrgz\VMConfiguration_Orig.ps1"
        ise ".\ConfigDataOrgz\VMConfiguration_nnd.ps1"
        
#Script Resource
        ise ".\ScriptResourceDemo\ScriptFirst.ps1"
        ise ".\ScriptResourceDemo\DSC script resource0.ps1"
        
    #Adding params:
        ".\ScriptResourceDemo\Remove-WBPolicyDemo.ps1"
        ise '.\ScriptResourceDemo\DSC script resource1.ps1'
        notepad "C:\DSC\Configs\dc1.mof"

    #Some pains
        ise ".\ScriptResourceDemo\UsingDemo.ps1"
        notepad "C:\DSC\Configs\dc1.mof"

#Custom Resource:
        ise ".\CustomResourceDemo\CustomResourceShell.ps1"
        ise ".\CustomResourceDemo\ScriptFirst.ps1"
        ise ".\CustomResourceDemo\mySMBShare\1.0.0.0\DSCResources\mySMBShare\mySMBShare.psm1"

#Class Resource:
        ise ".\ClassBasedResourceVersioning\SMBShareClass.psm1"   

#Tug:
        ise ".\Tug\Tug_Install_demo.ps1"

    #Configure a target LCM
        ise .\Tug\TugLCM.ps1
    #Compile a Config
        ise .\Tug\ParisTZ.ps1
    #Copy Config and Module to Tug Server
        ise .\Tug\copy-itemsToTugServer.ps1

#DSCEA
        ise .\DSCEA\DSCEATest.ps1


