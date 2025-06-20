
# SysmonLogParser.ps1

$logName = "Microsoft-Windows-Sysmon/Operational"
$eventIDs = @(1, 3, 11)  # High-value events

$results = foreach ($id in $eventIDs) {
    Get-WinEvent -LogName $logName -FilterXPath "*[System[(EventID=$id)]]" |
    ForEach-Object {
        [PSCustomObject]@{
            TimeCreated = $_.TimeCreated
            EventID     = $_.Id
            Message     = $_.Message
        }
    }
}

# Save to CSV in Documents
$csvPath = "$env:USERPROFILE\Documents\SysmonLogResults.csv"
$results | Export-Csv -Path $csvPath -NoTypeInformation

Write-Output "✅ Done! Log saved to: $csvPath"