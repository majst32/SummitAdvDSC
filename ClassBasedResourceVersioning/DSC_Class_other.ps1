New-ModuleManifest `
   -Path "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psd1" `
   -ModuleVersion 1.0.0.0 -DscResourcesToExport SMBShareClass `
   -RootModule "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psm1"

Compress-Archive 'C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\*' `
   -DestinationPath "C:\Powershell\pullsvrtest\SMBShareClass_1.0.0.0.zip"

New-DscChecksum -Path 'C:\Powershell\PullSvrTest\SMBShareClass_1.0.0.0.zip' -Force
copy-item -Path "C:\Powershell\PullSvrTest\*" `
   -Destination "\\Pull\C$\Program Files\WindowsPowershell\DSCService\Modules" -Recurse
