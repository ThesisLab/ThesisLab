# Copy and extract payload for every target computer
ForEach ($Computer in Get-Content C:\TestData\TestScripts\TargetComputers.txt) {

	# Define server variables
	$Time = ((Get-Date).ToUniversalTime()).ToString("yyyy-MM-ddTHH-mmZ")
	$Destination = "\\$Computer\c$\temp\"
	$JsonFileNameSecurity = $Computer + "_" + $Time + "_Security_NonMalicious.json"
	$JsonFileNameSysmon = $Computer + "_" + $Time + "_Sysmon_NonMalicious.json"
	$JsonLocalPathSecurity = $Destination + $JsonFileNameSecurity
	$JsonLocalPathSysmon = $Destination + $JsonFileNameSysmon
	$ResultsFolder = "C:\TestData\TestResults\"

	# Create temp path
	New-Item -ItemType "Directory" -Path $Destination | Out-Null

	# Execute payload for every target computer
	Invoke-Command -ComputerName $Computer -ScriptBlock { 

		# Define local workstation variables
		$PayloadFileName = "notepad.exe"
		$PayloadProcessName = "notepad"
		$PayloadFolderPath = "C:\Windows\" 
		$JsonFilePathSecurity = "C:\temp\" + $using:JsonFileNameSecurity
		$JsonFilePathSysmon = "C:\temp\" + $using:JsonFileNameSysmon

		# Clear event logs and start payload process
		WevtUtil cl Security
		WevtUtil cl Microsoft-Windows-Sysmon/Operational
		Start-Sleep 3
		Start-Process -FilePath $PayloadFileName -WorkingDirectory $PayloadFolderPath
		Start-Sleep 3

		# Extract Windows Security log events
		$Security = Get-WinEvent -LogName Security | Where-Object {$_.Id -eq 4688 -and $_.Message -like "*notepad.exe*" -and $_.Message -notlike "*conhost.exe*"} | ConvertTo-Json | ConvertFrom-Json
		$Security.TimeCreated = [Xml.XmlConvert]::ToString(($Security.TimeCreated),[Xml.XmlDateTimeSerializationMode]::Utc)
		$Security | ConvertTo-Json | Out-File -FilePath $JsonFilePathSecurity

		# Extract Windows Sysmon log events
		$Sysmon = Get-WinEvent -LogName Microsoft-Windows-Sysmon/Operational | Where-Object {$_.Id -eq 1 -and $_.Message -like "*notepad.exe*" -and $_.Message -notlike "*conhost.exe*"} | ConvertTo-Json | ConvertFrom-Json
		$Sysmon.TimeCreated = [Xml.XmlConvert]::ToString(($Sysmon.TimeCreated),[Xml.XmlDateTimeSerializationMode]::Utc)
		$Sysmon | ConvertTo-Json | Out-File -FilePath $JsonFilePathSysmon

		# Kill payload
		Stop-Process -Name $PayloadProcessName -Force
		Start-Sleep 3

		}

	# Copy extracted events to server and clean up destination folder
	Copy-Item $JsonLocalPathSecurity -Destination $ResultsFolder
	Copy-Item $JsonLocalPathSysmon -Destination $ResultsFolder
	Remove-Item -Recurse -Force $Destination

}