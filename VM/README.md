# Sample group Virtual Machine documentation

All sample group hosts were cloned from a single VM template host. <br>

## VM Template configuration

The VM template host was configured with the following steps:

1. Install Windows updates and reboot.
2. Install virtualization tools.
3. Enable local administrator account with set password and configure password to never expire:
```
Enable-LocalUser -Name "Administrator"
$Password = Read-Host -AsSecureString
Set-LocalUser -Name "Administrator" -Password $Password -PasswordNeverExpires $True
``` 
4. Logout from temporary account and login with local administrator account.
5. Remove temporary account:
```
Get-WMIObject -class Win32_UserProfile | Where-Object {($_.SID -like "*-1001")} | Remove-WmiObject
Remove-LocalUser -Name "Test"
``` 
6. Document Windows 10 operating system major, minr and update build revision versions:
```
PS C:\Users\Administrator> systeminfo
OS Name:                   Microsoft Windows 10 Enterprise
OS Version:                10.0.19045 N/A Build 19045

PS C:\Users\Administrator> (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name UBR).UBR
4046
```
7. Generalize Windows with SysPrep for cloning purposes and wait for host shutdown:
```
C:\Windows\system32\sysprep\sysprep.exe /generalize /shutdown /oobe
```
8. Change VM network adapter to Lab network.
9. Remove Windoows OS installation media.
   
<br>

The operating system version has been released on 2024-02-13:

| Servicing option | Availability date | Build | KB article |
| ---------------- | ----------------- | ----- | ---------- |
| General Availability Channel | 2024-02-13 | 19045.4046 | KB5034763

Windows 10 release information: https://learn.microsoft.com/en-us/windows/release-health/release-information


<br>
<br>

The below configurations were performed for each sample group host after cloning of the VM:




