
$ErrorActionPreference = 'silentlycontinue'

# VER DETAILS
$AVER = "2020.1 (1.0) STABLE"
$ASCRNAME = "SingleLink Clip"
$ASCRTITLE = "GNU/Wget For Windows"

# USER VARS
$ADOWNDIR = "$env:USERPROFILE\Downloads"

$Host.UI.RawUI.WindowTitle = "$ASCRTITLE $ASCRNAME $AVER"
mode.com con:cols=117 lines=20


Write-Host "--------------------------------------------------------------------------------------------------------------------
||| $ASCRTITLE ||| $ASCRNAME ||| $AVER |||
--------------------------------------------------------------------------------------------------------------------
 This program require a valid URL in your clipboard
--------------------------------------------------------------------------------------------------------------------"
$AURICLIP = Get-Clipboard
if (Invoke-WebRequest $AURICLIP) {
    .\bin\wget.exe -P "$ADOWNDIR" "$AURICLIP"
    Start-Process explorer.exe "$ADOWNDIR"
} else {
    Write-Host "Error, URI invalid. Reloading ..." -ForegroundColor Red
    Start-Sleep -Milliseconds 1200
}
Start-Process .\slink.exe
exit   