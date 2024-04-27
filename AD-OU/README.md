# Active Directory Organizational Unit documentation

Organizational Unit export PowerShell command:

> Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A
>
> Name               DistinguishedName
> ----               -----------------
> Domain Controllers OU=Domain Controllers,DC=lab,DC=local
> Lab                OU=Lab,DC=lab,DC=local
> Computers          OU=Computers,OU=Lab,DC=lab,DC=local
> Users              OU=Users,OU=Lab,DC=lab,DC=local
> Groups             OU=Groups,OU=Lab,DC=lab,DC=local
> Employees          OU=Employees,OU=Users,OU=Lab,DC=lab,DC=local
> Admin Accounts     OU=Admin Accounts,OU=Users,OU=Lab,DC=lab,DC=local
> Service Accounts   OU=Service Accounts,OU=Users,OU=Lab,DC=lab,DC=local
> Workstations       OU=Workstations,OU=Computers,OU=Lab,DC=lab,DC=local
> Servers            OU=Servers,OU=Computers,OU=Lab,DC=lab,DC=local
>



