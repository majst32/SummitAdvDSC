copy-item "C:\DSC\Configs\TimeZoneConfig.mof" '\\tug.company.pri\C$\Program Files\Tug\Server\var\DscService\Configuration\SHARED'
compress-archive 'C:\Program Files\WindowsPowerShell\Modules\xTimeZone\1.6.0.0\*' -DestinationPath '\\tug\C$\Program Files\Tug\Server\var\DscService\Modules\xTimeZone_1.6.0.0.zip'
New-DscChecksum -Path '\\tug.company.pri\C$\Program Files\Tug\Server\var\DscService\Modules\xTimeZone_1.6.0.0.zip'

