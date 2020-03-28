


$ErrorActionPreference = 'silentlycontinue'
Clear-Host
$AVER    = "2020.1 (1.0)"
$ADRIVES = Get-PSDrive -PSProvider FileSystem | Select-Object Root | findstr /L ":"
$Host.UI.RawUI.WindowTitle = "Searching Tool | Version $AVER"
mode.com con:cols=86 lines=35
Write-Host "------------------------------------------------------------------------------------
> Searching Tool | Version $AVER
------------------------------------------------------------------------------------
"
Write-Host "> Detected drives : "
$ADRIVES
$ADRVCHK = Read-Host "> Type the letter of the drive to search on it "
if (Get-PSDrive $ADRVCHK) {
    Write-Host "> Drive selected :"
    Write-Host "------------------------------------------------------------------------------------"
    Write-Host "Name --------- Used (GB) --- Free (GB) Provider ---- Root --------------------------
------------------------------------------------------------------------------------"
    Get-PSDrive -PSProvider FileSystem | findstr /L "$ADRVCHK" | findstr /V "Name"
    $ADC = $ADRVCHK
    $AMODE = Read-Host "
------------------------------------------------------------------------------------
> 1. Extension mode (Search all files with the extension)(Without the dot!)
> 2. Name mode (Search all files with the name exactly, including the extension!)
> 3. PartName Mode (Search all files containing the word)
------------------------------------------------------------------------------------
> Your choice "
    if ($AMODE -eq 1) {
        Write-Host "------------------------------------------------------------------------------------"
        $AEXT = Read-Host "> Type the extension to search "
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host ">> Scanning for file extension .$AEXT in the drive $ADC ..."
        Get-ChildItem "$($ADC):\" -Filter "*.$AEXT" -Recurse > $env:TEMP\srch.tmp
        Start-Process -Wait notepad.exe $env:TEMP\srch.tmp
        Remove-Item $env:TEMP\srch.tmp
        Start-Process .\stool.exe
    } elseif ($AMODE -eq 2) {
        Write-Host "------------------------------------------------------------------------------------"
        $AEXT = Read-Host "> Type the filename to search "
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host ">> Scanning for file named $AEXT in the drive $ADC ..."
        Get-ChildItem "$($ADC):\" -Filter "$AEXT" -Recurse > $env:TEMP\srch.tmp
        Start-Process -Wait notepad.exe $env:TEMP\srch.tmp
        Remove-Item $env:TEMP\srch.tmp
        Start-Process .\stool.exe
    } elseif ($AMODE -eq 3) {
        Write-Host "------------------------------------------------------------------------------------"
        $AEXT = Read-Host "> Type the partfilename to search "
        Write-Host "------------------------------------------------------------------------------------"
        Write-Host ">> Scanning for file named $AEXT in the drive $ADC ..."
        Get-ChildItem "$($ADC):\" -Filter "*$AEXT*" -Recurse > $env:TEMP\srch.tmp
        Start-Process -Wait notepad.exe $env:TEMP\srch.tmp
        Remove-Item $env:TEMP\srch.tmp
        Start-Process .\stool.exe
    } else {
        Start-Process .\stool.exe
    }
} else {
    Write-Host "------------------------------------------------------------------------------------
x> $ADRVCHK | ExceptionError_NoExistingDevice
x> Error. The drive entered does not exist anymore on your system ! Reloading .....
------------------------------------------------------------------------------------" -ForegroundColor DarkRed
    Start-Sleep -Seconds 3
    Start-Process .\stool.exe
}