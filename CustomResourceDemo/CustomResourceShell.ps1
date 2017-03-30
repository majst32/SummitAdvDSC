$ShareName = New-xDscResourceProperty -name Name -Type String -Attribute Key -Description "Name of the share to be created"
$SharePath = New-xDscResourceProperty -name Path -type String -Attribute Required -Description "Path to share"
$Ensure = New-xDscResourceProperty -name Ensure -Type String -Attribute Write -ValueMap "Present","Absent" -Values "Present","Absent" -Description "Determines if resource is present or not present."

New-xDscResource -name MySMBShare2 -Path 'C:\Program Files\WindowsPowerShell\Modules' -ModuleName mySMBShare2 -Property $ShareName,$SharePath,$Ensure
