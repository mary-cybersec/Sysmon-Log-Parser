### 📸 Sample Output

Here’s a screenshot of a sample Sysmon process creation report:

![Sysmon Output](sysmon-output.png)
 ## Sysmon Log Parser - PowerShell Script

Overview

The Sysmon Log Parser is a PowerShell script designed to help SOC analysts and cybersecurity professionals identify suspicious process creation activity using Sysmon Event ID 1 logs. It extracts key telemetry from the Windows Event Log and flags potential indicators of compromise based on known suspicious patterns.

⸻

# What It Does
	•	Parses Microsoft-Windows-Sysmon/Operational logs
	•	Extracts:
	•	Process image
	•	Command line
	•	Parent process
	•	User
	•	Timestamp
	•	Flags suspicious commands (e.g., powershell -enc, regsvr32, wscript)
	•	Outputs a CSV report with a Suspicious column for quick triage

⸻

 ## Output

The script saves a report to:

C:\Users\<Username>\Documents\Sysmon_Report.csv

Sample columns:
	•	TimeCreated
	•	Image
	•	CommandLine
	•	ParentImage
	•	User
	•	Suspicious

⸻

 ## Use Case

This tool is ideal for:
	•	Home lab monitoring
	•	Security event triage
	•	Blue team training environments
	•	Building detection rules based on real-world process activity

⸻

 ## How to Use

.\SysmonLogParser.ps1

Make sure Sysmon is installed and logging is enabled.
This script requires administrative privileges to access event logs.

⸻

 Detection Logic

Suspicious patterns include:

powershell -enc
wscript
cscript
cmd.exe /c
regsvr32
mshta
rundll32
Invoke-WebRequest
DownloadString


⸻

 Requirements
	•	Windows OS with Sysmon installed
	•	PowerShell 5.1+
	•	Admin privileges

⸻

Next Steps
	•	Map findings to MITRE ATT&CK techniques
	•	Integrate with email alerting
	•	Add scheduled task support

⸻

 Author
Mary-cybersec
