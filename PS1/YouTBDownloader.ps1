
$AVER = "ytb.stable.1.0"
$ASCRNAME = "Youtube Downloader | Version $AVER"

$Host.UI.RawUI.WindowTitle = "$ASCRNAME"

# Auto Update, To make the script indestructible
Write-Host "
 Checking for Update ...
" -ForegroundColor Green
.\ydl.exe -U 2>$null >$null
Start-Sleep -Milliseconds 800

mode.com con:cols=57 lines=30

Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

Write-Host "---------------------------------------------------------
> $ASCRNAME
--VIDEO--------------------------------------------------
> 1. Download one video (highest quality)             ---
> 2. Download one video (custom quality)              ---
> 3. Download one playlist (limited to 100 videos)    ---
> 4. Download one playlist (no limit, maybe instable) ---
--AUDIO--------------------------------------------------
> 5. Download one video as MP3                        ---
> 6. Download one video as M4A                        ---
--MODULAR------------------------------------------------
> 7. Download videos in a txt file (links)            ---
> 8. Download videos in a txt file (links, as MP3)    ---
> 9. Download videos in a txt file (links, as M4A)    ---
---------------------------------------------------------"
$ACHOICE = Read-Host "> Make your choice "
Write-Host "Please select your wanted Output folder,
it's recommended to make a new one for Playlist."
$AFOLDCHOICE = Get-Folder
$AOD         = "$AFOLDCHOICE" 
if ($ACHOICE -eq 1) {
    $AURI = Read-Host "> Paste the URL of the video (like https://youtube.com/"
    .\ydl.exe $AURI -o "$AOD"
}