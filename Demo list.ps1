#Setup
######################################################################################
### REMEMBER TO ADD A SECOND DISK TO YOUR DC FOR THIS DEMO!!  And online the disk. ###
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
        ise ".\ScriptResourceDemo\Remove-WBPolicyDemo.ps1"
        ise '.\ScriptResourceDemo\DSC script resource1.ps1'
        notepad "C:\DSC\Configs\dc1.mof"

    #Some pains
        ise ".\ScriptResourceDemo\UsingDemo.ps1"
        notepad "C:\DSC\Configs\dc1.mof"





