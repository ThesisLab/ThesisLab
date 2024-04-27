# Active Directory Group Policy Object documentation

Group Policy Object export PowerShell commands:

> $dc = Get-ADDomainController -Discover -Service PrimaryDC  
> Get-GPOReport -All -Domain lab.local -Server $dc.Name -ReportType HTML -Path C:\Temp\GPOReport.html
> Get-GPOReport -All -Domain lab.local -Server $dc.Name -ReportType XML -Path C:\Temp\GPOReport.xml

The exported GPO configuration is available as HTML and XML files:

[GPOReport.html](GPOReport.html)
[GPOReport.xml](GPOReport.xml)
