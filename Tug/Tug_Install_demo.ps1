Enter-PSSession Tug

Register-PSRepository -Name tug-pre -SourceLocation https://www.myget.org/F/tug/api/v2
Find-Module -Repository tug-pre
Install-Module -Repository tug-pre Tug.Server-ps5


#If Upgrading tug install
<#Remove-Module tug.Server-ps5 -force
Uninstall-Module Tug.Server-ps5 -force
Install-Module -Repository tug-pre Tug.Server-ps5
#>

Import-Module Tug.Server-ps5
Install-TugServer #-overwrite

cd 'C:\Program Files\Tug\Server'
copy-item "\\auth\C$\Github\SummitAdvDSC\Tug\BasicTugCmdlets.ps1" -destinationPath "C:\Program Files'\Tug\Server" -Force
.\tug-server.cmd

New-NetFirewallRule -name "Tug Inbound" -DisplayName "Tug Inbound" -Enabled true -Direction Inbound -Protocol TCP -LocalPort 5000

