#Get-FailedLogins.ps1
#Analysis of Failed and Successful Logons from the Security Event Log

$timeFrame = (Get-Date).AddHours(-24) # Last 24 hours

#Getting Failed Logins (4625)
$failedLogons = Get-WinEvent -FilterHashtable @{LogName='Security'; Id = 4625; StartTime=$timeFrame}|
	ForEach-Object{
		$xml = [xml]$_.ToXml()
		[PSCustomObject]@{
			TimeCreated = $_.TimeCreated
			Account = $xml.Event.EventData.Data[5].'#text'
			IPAddress = $xml.Event.EventData.Data[18].'#text'
			FailureReason = $xml.Event.EventData.Data[11].'#text'
		}
	}

#Getting success logons (4624)
$successLogons = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4624; StartTime=$timeFrame}|
	ForEach-Object{
		$xml = [xml]$_.ToXml()
		[PSCustomObject]@{
			TimeCreated = $_.TimeCreated
			Account = $xml.Event.EventData.Data[5].'#text'
			IPAdress = $xml.Event.EventData.Data[18].'#text'
			LogonType = $xml.Event.EventData.Data[8].'#text'
		}
	}

#Output
Write-Host "`n===== Failed Logons (4625) =====`n"
$failedLogons | Format-Table

Write-Host "`n===== Successful Logons (4624) =====`n"
$successLogons | Format-Table
