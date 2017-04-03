New-ModuleManifest `
   -Path "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psd1" `
   -ModuleVersion 1.0.0.0 -DscResourcesToExport SMBShareClass `
   -RootModule "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\1.0.0.0\SMBShareClass.psm1"

copy-item "C:\Program Files\WindowsPowerShell\Modules\SMBShareClass\*" -Destination "\\tgtpull\C`$\Program Files\WindowsPowerShell\Modules\SMBShareClass" -Recurse