import-module xDSCResourceDesigner

$BackupTime = New-xDscResourceProperty -name BackupTime -Type DateTime -Attribute Key -Description "Time to set the backup to run"
$DiskNumber = New-xDscResourceProperty -name DiskNumber -Type Uint32 -Attribute Key -Description "Disk number to write the backup to"
$Ensure = New-xDscResourceProperty -name Ensure -Type String -Attribute Required -ValueMap "Present","Absent" -Values "Present","Absent" -Description "Determines if setting is present or absent"
 
New-xDscResource -name xSSBackup -Property $BackupTime,$DiskNumber,$Ensure -Path "C:\Program Files\WindowsPowerShell\Modules" -ModuleName xSSBackup

