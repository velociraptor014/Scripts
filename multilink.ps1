
Clear-Host

$ErrorActionPreference = 'silentlycontinue'
$AVER           = "2020.1 (1.0) STABLE"
$ADOWNDIR       = "$env:USERPROFILE\Downloads"
$ASCRNAME       = "GNU/Wget For Windows"
$ASCRMODEL      = "MultiLink"

$Host.UI.RawUI.WindowTitle = "$ASCRNAME $ASCRMODEL $AVER"
mode.com con:cols=117 lines=10

Write-Host "--------------------------------------------------------------------------------------------------------------------
||| $ASCRNAME ||| $ASCRMODEL ||| Version $AVER |||
--------------------------------------------------------------------------------------------------------------------
           1. Start download based on the linktest (speedtest)(thinkbroadband.datapack)
 (default) 2. Start download using your file (txt or datapack file)(open as)(autodestination)
--------------------------------------------------------------------------------------------------------------------"
$ACHOICE = Read-Host "> Your choice ? "
if ($ACHOICE -eq 1) {
    ForEach ($link in (Get-Content ".\thinkbroadband.datapack")) {
        Clear-Host
        Write-Host "--------------------------------------------------------------------------------------------------------------------
 Testing Download $link ...
--------------------------------------------------------------------------------------------------------------------"
        .\bin\wget.exe $link --directory-prefix=$ADOWNDIR
        Set-Location $ScriptDir
    }
}
if ($ACHOICE -eq 2) {
    Write-Host "> Please select your file (txt, datapack) ..."
    Add-Type -AssemblyName System.Windows.Forms
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
    $null = $FileBrowser.ShowDialog()
    $ADOWNDIRNAME = Read-Host "> Please type the name of the folder you want to save the file "
    New-Item -ItemType Directory $ADOWNDIR\$ADOWNDIRNAME
    ForEach ($link in (Get-Content $FileBrowser.FileName)) {
        Clear-Host
        Write-Host "--------------------------------------------------------------------------------------------------------------------
 Downloading $link to $ADOWNDIR\$ADOWNDIRNAME ...
--------------------------------------------------------------------------------------------------------------------"    
        .\bin\wget.exe $link --directory-prefix="$ADOWNDIR\$ADOWNDIRNAME"
    }
    Start-Process explorer.exe "$ADOWNDIR\$ADOWNDIRNAME"
}
Start-Process .\mlink.exe
exit