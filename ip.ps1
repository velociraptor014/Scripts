####
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding(437)




$ErrorActionPreference = 'silentlycontinue'
Clear-Host


$AVER        = "2020.1 (1.0)"
$AEXTRACT    = "$env:USERPROFILE"
$AEXTFOLD    = ".iptool"
$ACSVFOLD    = "CSV"
$ARAWFOLD    = "RAW"
$ALOGFOLD    = "LOG"
$ADATE       = Get-Date -Format dd-MM-yyyy.HH-mm-ss


Function Update-Date
{ 
    $ADATE       = Get-Date -Format dd-MM-yyyy.HH-mm-ss
}

New-Item -ItemType Directory "$AEXTRACT\$AEXTFOLD"
New-Item -ItemType Directory "$AEXTRACT\$AEXTFOLD\$ARAWFOLD"
New-Item -ItemType Directory "$AEXTRACT\$AEXTFOLD\$ACSVFOLD"

$Host.UI.RawUI.WindowTitle = "IP Tool | Version $AVER"

Write-Host "-----------------------------------------------------------------------------------------------------------------------
- IP Tool -- Configuration Management Tool ----------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- INFORMATIONS -------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
- 1. View the current configuration                                        --------------------------------------------
- 2. View the current configuration (advanced)                             --------------------------------------------
- 3. Extract the current configuration to a RAW file (txt)                 --------------------------------------------
- 4. Extract the current configuration to a CSV file (csv/excel)           --------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- CONFIGURATIONS ACTIONS----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
- 5. Release IP                                                            --------------------------------------------
- 6. Renew IP                                                              --------------------------------------------
- 7. Refresh IP                                                            --------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
- 8. Open the extraction folder                                            --------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
"
$ACH = Read-Host "- $env:USERNAME, Your choice ? "
# INFORMATIONS
if ($ACH -eq 1) {
    Clear-Host
    Write-Host "------- IPCONFIG EXTRACTION -------"
    ipconfig > $env:TEMP\ipc.tmp
    Start-Process -Wait notepad.exe $env:TEMP\ipc.tmp
    Remove-Item "$env:TEMP\ipc.tmp"
} elseif ($ACH -eq 2) {
    Clear-Host
    Write-Host "------- IPCONFIG ADVANCED EXTRACTION -------"
    ipconfig /all > $env:TEMP\ipc.tmp
    Start-Process -Wait notepad.exe $env:TEMP\ipc.tmp
    Remove-Item "$env:TEMP\ipc.tmp"
} elseif ($ACH -eq 3) {
    Clear-Host
    Write-Host "------- IPCONFIG ADVANCED RAW EXTRACTION -------"
    Write-Output "- RAW ------------------------------- IPTOOL $AVER --------------------------------- $ADATE ----" > $AEXTRACT\$AEXTFOLD\$ARAWFOLD\raw.ipconfig.$ADATE.txt
    ipconfig /all >> $AEXTRACT\$AEXTFOLD\$ARAWFOLD\raw.ipconfig.$ADATE.txt
    Write-Host "- File ready inside $AEXTRACT\$AEXTFOLD\$ARAWFOLD\raw.ipconfig.$ADATE.txt" -ForegroundColor Green
    Pause
} elseif ($ACH -eq 4) {
    Clear-Host
    Write-Host "------- IPCONFIG ADVANCED CSV EXTRACTION -------"
    Write-Output "- CSV ------------------------------- IPTOOL $AVER --------------------------------- $ADATE ----" > $AEXTRACT\$AEXTFOLD\$ACSVFOLD\csv.ipconfig.$ADATE.csv
    ipconfig /all >> $AEXTRACT\$AEXTFOLD\$ACSVFOLD\csv.ipconfig.$ADATE.csv
    Write-Host "- File ready inside $AEXTRACT\$AEXTFOLD\$ACSVFOLD\csv.ipconfig.$ADATE.csv" -ForegroundColor Green
    Pause


# CONFIGURATIONS ACTIONS
} elseif ($ACH -eq 5) {
    Clear-Host
    Write-Host "------- IP RELEASING PROCEDURE -------"
    Write-Host "- Releasing IP ..."
    ipconfig /release >$null
    Write-Host "- IP released." -ForegroundColor Green
    ipconfig | findstr /L Ad | findstr /V IPv6
    Start-Sleep -Milliseconds 2500
} elseif ($ACH -eq 6) {
    Clear-Host
    Write-Host "------- IP RENEWING PROCEDURE -------"
    Write-Host "- Renewing IP ..."
    ipconfig /renew >$null
    Write-Host "- IP renewed." -ForegroundColor Green
    ipconfig | findstr /L Ad | findstr /V IPv6
    Start-Sleep -Milliseconds 2500
} elseif ($ACH -eq 7) {
    Clear-Host
    Write-Host "------- IP REFRESHING PROCEDURE -------"
    Write-Host "- Releasing IP ..."
    ipconfig /release >$null
    Write-Host "- IP released." -ForegroundColor Green
    ipconfig | findstr /L Ad | findstr /V IPv6
    Start-Sleep -Milliseconds 2500
    Write-Host "- Renewing IP ..."
    ipconfig /renew >$null
    Write-Host "- IP renewed." -ForegroundColor Green
    ipconfig | findstr /L Ad | findstr /V IPv6
    Start-Sleep -Milliseconds 2500
} elseif ($ACH -eq 8) {
    Start-Process explorer.exe "$AEXTRACT\$AEXTFOLD"
} else {
    Write-Host "- No Input or invalid one." -ForegroundColor Red
}






###########################################
Start-Process .\ip.exe
###########################################