# Sample group Virtual Machine documentation

All sample group hosts were cloned from a single VM template host. <br>
The VM template host was configured with the following steps:

1. Install Windows updates and reboot.
2. Install virtualization tools.
3. Enable local administrator account with set password and confifure password to enver expire:
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
6. Document Windows 10 version:
```
systeminfo
(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name UBR).UBR
```
7. Generalize Windows with SysPrep for cloning purposes and wait for host shutdown:
```
C:\Windows\system32\sysprep\sysprep.exe /generalize /shutdown /oobe
```
8. Change VM network adapter to Lab network.
9. Remove Windoows OS installation media.
   

<br>
<br>

The below configurations were performed for each sample group host after cloning of the VM:




