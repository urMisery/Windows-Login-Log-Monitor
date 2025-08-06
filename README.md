# Windows Login Log Monitor

This PowerShell script monitors Windows Event Logs for login attempts (successful and failed).

## 🛠 Features

- Reads Security Event Log (Event IDs 4624 and 4625)
- Displays username, time, IP address, and result
- Separates successful and failed login attempts
- Designed for Windows auditing use

## 🚀 Usage

> Run as administrator!
Type ./Get-FailedLogins.ps1

# Example Output
```powershell

.\Get-FailedLogins.ps1
===== Failed Logons (4625) =====
TimeGenerated   AccountName   IPAddress     FailureReason
----------------------------------------------------------
08/06/2025      admin         192.168.1.5   Unknown user name or bad password

===== Successful Logons (4624) =====
TimeGenerated   AccountName   IPAddress     LogonType
----------------------------------------------------------
08/06/2025      admin         192.168.1.5   Interactive
```
