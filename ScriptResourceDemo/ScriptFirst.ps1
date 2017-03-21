#Present
$BackupTime = [datetime]::today.AddHours(21)
$Policy = New-WBPolicy
Set-WBSchedule -Policy $Policy -Schedule $BackupTime
$Target = New-WBBackupTarget -Disk (get-wbdisk | Where-Object {$_.DiskNumber -eq 1})
Add-WBBackupTarget -Policy $Policy -Target $Target -force
Add-WBSystemState -Policy $Policy
Set-WBPolicy -AllowDeleteOldBackups -Policy $Policy -force


#Absent
$Policy = Get-WBPolicy -Editable
if ($Policy -ne $Null){
   Remove-WBPolicy -Policy $Policy -Force
    }
     