





Clear-Host

$AVER = "2020.1 (1.0)"

$AHOST = "$env:COMPUTERNAME"



$HOST.UI.RAWUI.WindowTitle = "System Information Tool | Version $AVER"



Write-Host "-------------------------- Everything are extracted as ---
- System Information Tool- a TXT file inside your user ---
-------------------------- folder, inside ".sysinfo"   ---
-- GENERIC -----------------------------------------------
- 1. View simple informations (Easy Info)              ---
- 2. View advanced informations (More Info)            ---
- 3. View full informations (Including Useless one)    ---
-- SPECIFIC ----------------------------------------------
- 4. View RAM Infos                                    ---
- 5. View CPU Infos                                    ---
- 6. View OS Infos                                     ---
- 7. View BIOS Infos                                   ---
- 8. View 
----------------------------------------------------------
"