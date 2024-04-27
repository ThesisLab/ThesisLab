# Active Directory Organizational Unit documentation

Organizational Unit export PowerShell command:

> Get-ADOrganizationalUnit -Filter 'Name -like "*"' | Format-Table Name, DistinguishedName -A
>
> Name   DistinguishedName
>              
> Domain Controllers OU=Domain Controllers,DC=lab,DC=local <br />
> Lab                OU=Lab,DC=lab,DC=local <br />
> Computers          OU=Computers,OU=Lab,DC=lab,DC=local <br />
> Users              OU=Users,OU=Lab,DC=lab,DC=local <br />
> Groups             OU=Groups,OU=Lab,DC=lab,DC=local <br />
> Employees          OU=Employees,OU=Users,OU=Lab,DC=lab,DC=local <br />
> Admin Accounts     OU=Admin Accounts,OU=Users,OU=Lab,DC=lab,DC=local <br />
> Service Accounts   OU=Service Accounts,OU=Users,OU=Lab,DC=lab,DC=local <br />
> Workstations       OU=Workstations,OU=Computers,OU=Lab,DC=lab,DC=local <br />
> Servers            OU=Servers,OU=Computers,OU=Lab,DC=lab,DC=local <br />
>

```
testing
```



