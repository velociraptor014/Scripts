


$MVER        = "2020.1 (1.0) STABLE"
$MSCR        = "GNU/Wget for Windows"
$MSCRN       = "Main Menu"

mode.com con:cols=67 lines=10

$Host.UI.RawUI.WindowTitle = "$MSCR $MVER $MSCRN"
Clear-Host
Write-Host "------------------------------------------------------------------
||| $MSCR ||| $MVER ||| $MSCRN |||
------------------------------------------------------------------
 1. MultiLink Downloader (Mlink)
 2. SingleLink Downloader (Slink)
 3. SingleLink Clipboard Downloader (SlinkClip)(OneLink)
------------------------------------------------------------------"
$MCHOICE = Read-Host "> Your choice ? "
if ($MCHOICE -eq 1) {
    Clear-Host
    Start-Process .\mlink\mlink.exe
} elseif ($MCHOICE -eq 2) {
    Clear-Host
    Start-Process .\slink\slink.exe
} elseif ($MCHOICE -eq 3) {
    Clear-Host
    Start-Process .\slink\slink_clip.exe
} else {
    Clear-Host
    Start-Process .\WGetForWindows.exe
}
exit