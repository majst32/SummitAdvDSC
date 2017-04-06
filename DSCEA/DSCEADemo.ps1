Start-DSCEAscan -MofFile C:\DSC\Configs\TgtPull.mof -ComputerName CLI1,TgtPull
Get-DSCEAreport -Overall
explorer .\OverallComplianceReport.html

Start-DSCEAscan -MofFile C:\dsc\Configs\ENTSub.mof -ComputerName EntSub
Get-DSCEAreport -ComputerName entsub
explorer .\ComputerComplianceReport-entsub.html

explorer https://microsoft.github.io/DSCEA/