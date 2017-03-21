#Autolab

#Script Resource
    #The design debate - Start with test, or start with set?
        #Can go either way - example - things that do not have PowerShell commands - certutil -dspublish
        #Areas where PowerShell commands are incomplete - group policy - may be easier to get than to set
    
    #The good -
        #super easy to design and quickly find out if something is possible
        #Only need to deal with one scenario - Absent OR present
        #Scope can be very narrow at first - like I want to create a script resource with These Set Concrete Parameters.
        #Don't have to boil the ocean - Resource does not have to handle every possible scenario
        #Can consider it "Done" when it works - especially for labs 
        ise .\ScriptFirst.ps1
        ise ".\DSC script resource0.ps1"
            #add parameters - show that it doesn't work

    #The bad
        #Using
        ise .\UsingDemo.ps1
        #Using in strings
            #Replace CACN and DomainDN with parameters
            #Show it still not working - now what?
            #Show additional lines of code, like $CN = $Using:Node.CACN
            #If there is another option here show that - talk to Jason (in my mind there is still another way to do this)
        #Testing - hard with $Using - better to test with hard-coded parameters but difficult to troubleshoot otherwise
        #A look at the MOF file

    #The weird
        #Get-Script returns Hashtable with one value - @{Result = "blah"}

#Moving to a Custom Resource
    #DSC book says it's "about 4 lines of code" but it isn't really
    #DSC Resource Designer (tell story - started with custom resource and code, not schema, got fancy with parameter types, code worked, resource bombed)
    ise .\CustomResourceShell

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

#Publish-ModulesandMof

