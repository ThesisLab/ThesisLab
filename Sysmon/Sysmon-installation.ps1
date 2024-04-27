# Copy Sysmon files from network share to a local directory
New-Item -ItemType Directory "C:\Windows\Sysmon\" -Force -ErrorAction SilentlyContinue
Copy-Item "\\labdc01.lab.local\Shares\Sysmon\Sysmon64.exe" -Destination "C:\Windows\Sysmon\Sysmon64.exe" -Force | Out-Null
Copy-Item "\\labdc01.lab.local\Shares\Sysmon\sysmon-config-lab.xml" -Destination "C:\Windows\Sysmon\sysmon-config-lab.xml" -Force | Out-Null
Start-Sleep -Seconds 10

# Verify if Sysmon is already installed and running, if not install with lab config
if (Get-Process -Name "Sysmon64") {
    # Process is currently running, do nothing
} else {
    # Start Sysmon with lab config
    Start-Process -FilePath "C:\Windows\Sysmon\Sysmon64.exe" -Wait -ArgumentList "-accepteula -i C:\Windows\Sysmon\sysmon-config-lab.xml" -WindowStyle Hidden
}
