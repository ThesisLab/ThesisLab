# Sysmon documentation

- Sysmon agent installation and configuration has been done with [Sysmon-installation.ps1](Sysmon-installation.ps1) file.
- The [sysmon-config-lab.xml](sysmon-config-lab.xml) contains the Sysmon agent configuration file.

<br>

The SHA256 hash validation of the Sysmon64.exe binary with PowerShell:

```
Get-FileHash -Algorithm SHA256 C:\Shares\Sysmon\Sysmon64.exe | fl


Algorithm : SHA256
Hash      : 39B094613132377BC236F4AD940A3E02C544F86347C0179A9425EDC1BD3B85CD
Path      : C:\Shares\Sysmon\Sysmon64.exe
```


