Write-Host "THIS TOOL EXTRACT STANDARD SYSTEM INFORMATION FROM POWERSHELL AND WMIC DATABASE, CLIC OK TO CONTINUE"
Get-ComputerInfo > sysinfo.tmp
Start-Process -Wait notepad.exe .\sysinfo.tmp
Remove-Item .\sysinfo.tmp