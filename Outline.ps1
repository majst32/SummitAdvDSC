#Setup
cd C:\Github\SummitAdvDSC

#Autolab - Jason

#ConfigurationData


#Script Resource
    #The design debate - Start with test, or start with set?
        #Can go either way - example - things that do not have PowerShell commands - certutil -dspublish
        #Areas where PowerShell commands are incomplete - group policy - may be easier to get than to set
    
    #The good -
        #quick / easy 
        #Present / absent
        #parameters can just be used
        #just mandatory params
        #Done-ness

REMEMBER TO ADD A SECOND DISK TO YOUR DC FOR THIS DEMO!!  And online the disk.

        ise ".\ScriptResourceDemo\ScriptFirst.ps1"
        ise ".\ScriptResourceDemo\DSC script resource0.ps1"
            #add parameters - show that it doesn't work
            #Replace parameters with Using

    #The bad
        #Using
        ise .\ScriptResourceDemo\UsingDemo.ps1
        #Using in strings
            #Replace CACN and DomainDN with parameters
            #Show it still not working - now what?
            #Show write-verbose as a troubleshooting tool
            #Show additional lines of code, like $CN = $Using:Node.CACN
            #If there is another option here show that - talk to Jason (in my mind there is still another way to do this)

        #Testing - hard with $Using - better to test with hard-coded parameters but difficult to troubleshoot otherwise
        #A look at the MOF file

    #The different
        #Get-Script returns Hashtable with one value - @{Result = "blah"}

#Moving to a Custom Resource
    #DSC book says it's "about 4 lines of code" but it isn't really
    #DSC Resource Designer (tell story - started with custom resource and code, not schema, got fancy with parameter types, code worked, resource bombed)
    ise .\ScriptResourceDemo\CustomResourceShell.ps1

    #Increasing Scope
        #Absent and Present
        #Not just about a single configuration setting

    #Perils of Parameter Types
        #DSC Resource Designer (tell story - started with custom resource and code, not schema, got fancy with parameter types, code worked, resource bombed)
    #DSC Resource Designer 
    #Testing with PSBoundParameters
    #Testing the set function - set is successful if no errors are received - NOT if the set is successful.  Reference:  external commands (ICACLs, certutil)
    #Testing methodology - loading functions into memory, invoke-DSCResource

#Moving to (or creating) Class-Based Resource
    #Versioning is the New Hotness

#Configuration Data and Non-Node Data

    
#Pull-Tug-Shove

#Tug Server
#Install the TUG Server
.\Tug\Tug_Install_demo.ps1
#Replace PS5Handler (and show)
.\tug\BasicTugCmdlets.ps1

#Tug Client
#Configure a target LCM
.\Tug\TugLCM.ps1
#Compile a Config
.\Tug\ParisTZ.ps1
#Copy Config and Module to Tug Server
.\Tug\copy-itemsToTugServer.ps1
#Demo Reporting <get info>

#Publish-ModulesandMof

#Teaching DSC TO Junior Admins (Jason)

