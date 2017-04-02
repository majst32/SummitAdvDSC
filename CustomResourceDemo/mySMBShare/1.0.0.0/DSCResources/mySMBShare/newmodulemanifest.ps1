$Params = @{
    Path = "C:\Program Files\WindowsPowerShell\Modules\mySMBShare\1.0.0.0\mySMBShare.psd1"
    Author = 'Missy Januszko'
    ModuleVersion = '1.0.0.0'
    }

New-ModuleManifest @Params -Guid (New-Guid)