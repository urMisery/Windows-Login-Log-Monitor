# Windows Login Log Monitor

This PowerShell script monitors Windows Event Logs for login attempts (successful and failed).

## 🛠 Features

- Reads Security Event Log (Event IDs 4624 and 4625)
- Displays username, time, IP address, and result
- Separates successful and failed login attempts
- Designed for Windows auditing use

## 🚀 Usage

> Run Powershell as administrator!
>
> Go to the directory where your script is located (e.g "cd C:\Users\YourUser\Desktop")
>
> And type ./Get-FailedLogins.ps1
>
> If you had issue like "**_Get-FailedLogins.ps1 cannot be loaded because running scripts is disabled on this system._**", do this:
>   1. Type **Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass** command.
>   2. Confirm changes
>   3. Try to execute script again

# 🧪 Example Output
```powershell
.\Get-FailedLogins.ps1
===== Failed Logons (4625) =====

TimeCreated         Account       IPAddress        FailureReason
------------        -------       ---------        --------------
08/06/2025 12:15    testUser1     192.168.1.50     5
08/06/2025 13:04    admin         10.0.0.25        7
08/06/2025 13:45    guest         172.16.2.30      11

===== Successful Logons (4624) =====

TimeCreated         Account       IPAddress        LogonType
------------        -------       ---------        ---------
08/06/2025 14:45    domainUser1   10.0.0.14        2
08/06/2025 15:30    localAdmin    127.0.0.1        10
```
