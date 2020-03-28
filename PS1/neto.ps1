#
# NETO - Codename JIRCANA
#

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
        [Security.Principal.WindowsBuiltInRole] "Administrator")
# AADMIN is variable for admin acc

# !!!
$ErrorActionPreference = 'silentlycontinue'
# !!!
# CONFIG
# Synthax : A = Active + VarName (like "USER")
Clear-Host
# ALOGS              = "$env:USERPROFILE\.netodiag"

$ARANDOM            = Get-Random -Minimum 1000 -Maximum 9999
$ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
$ANAME              = "netorun.$ADATE.$ARANDOM.log"
$AVER               = "1.1"
$AYEARVER           = "2020.11"

# STABLE / UNSTABLE / BETA / ALPHA / TESTING
$AVERSTATE          = "STABLE"

New-Item -ItemType Directory "$env:USERPROFILE\.netodiag" >$null
New-Item "$env:USERPROFILE\.netodiag\$ANAME" >$null
$host.UI.RawUI.WindowTitle      = "Networking Diagnostic Tool | NETO version $AVER"
$host.UI.RawUI.WindowSize.Width = 81

# LOG RULE : Use only the $ANAME for Write-Output to Logs. The name will NOT change after each
# tests, ping or anything.

Write-Output "LOG > $ADATE : Session NETO started, ID : $ARANDOM" > $env:USERPROFILE\.netodiag\$ANAME
$ASESSION = "$env:USERPROFILE\.netodiag\$ANAME"

# PS C:\Windows\system32> Get-NetAdapter | Disable-NetAdapter -Confirm:$false
# PS C:\Windows\system32> Get-NetAdapter | Enable-NetAdapter -Confirm:$false
# Restart-Service [name] IP : iphlpsvc   NET : lmhosts   TCP :     UI : NcaSvc    P2P : p2pimsvc
# BITS : BITS            NSI : nsi       DATA : netprofm MAN : netman
Get-NetAdapter | Select-Object Name,Status | Format-List > "$env:USERPROFILE\.netodiag\net.tmp"
$ANETSTATE = Get-Content "$env:USERPROFILE\.netodiag\net.tmp"
Remove-Item $env:USERPROFILE\.netodiag\net.tmp
Write-Host -NoNewline "-----------------------------------------------------------------------------------------------------------------------
 Networking Diagnostic Tool | NETO version $AVER
 The Velociraptor 0.14      | $AYEARVER $AVERSTATE
-----------------------------------------------------------------------------------------------------------------------
 This tool allow you to test, configure and diagnose your network configuration
-----------------------------------------------------------------------------------------------------------------------
 Network Adapters state :"
$ANETSTATE
Write-Host "-----------------------------------------------------------------------------------------------------------------------
 I. Ping One IP
 P. Ping Internet (1.1.1.1 and 8.8.8.8)
 L. Ping Local (127.0.0.* over range 50 or 100)
 D. Ping Domain IPs (Need to be specified inside DIP.datapack file)

 1. Restart all networking adapters (Driver Reboot)
 2. Restart Windows Network Service (System Services/WIN.SERVICE.datapack file)
-----------------------------------------------------------------------------------------------------------------------
 Choice : "
$ACHOICE = Read-Host
if ($ACHOICE -eq "I") {
    $AIP = Read-Host " IP or Hostname ? "
    $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
    Write-Output "LOG > $ADATE : IP/Hostname check | NET : $AIP" >> $env:USERPROFILE\.netodiag\$ANAME
    Write-Host "-----------------------------------------------------------------------------------------------------------------------"
    Write-Host -NoNewline " Testing ....... "
    if (Test-Connection -BufferSize 2 -Count 1 -Quiet $AIP) {
        Write-Host -ForegroundColor Green "Reachable   | OK | $AIP appear to be connected or online"
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
        Write-Output "LOG > $ADATE : IP/Hostname check success" >> $env:USERPROFILE\.netodiag\$ANAME
    } else {
        Write-Host -ForegroundColor Red "Unreachable | KO | $AIP appear to be disconnected or offline"
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
        Write-Output "LOG > $ADATE : IP/Hostname check failed" >> $env:USERPROFILE\.netodiag\$ANAME
    }
    Pause
}
if ($ACHOICE -eq "P") {
    Write-Host " Testing Internet Link 
-----------------------------------------------------------------------------------------------------------------------"
$AWWW = Get-Content .\WorldWideWeb.datapack
Write-Output "LOG > $ADATE : Started internet link check" >> $env:USERPROFILE\.netodiag\$ANAME
$ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
foreach ($AWWWEXEC in $AWWW) {
    if (Test-Connection -BufferSize 2 -Count 1 -Quiet $AWWWEXEC) {
    Write-Host -ForegroundColor Green "Reachable   | OK | $AWWWEXEC appear to be connected or online"
    $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss
    Write-Output "LOG > $ADATE : Success for $AWWWEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
    } else {
    Write-Host -ForegroundColor Red "Unreachable | KO | $AWWWEXEC appear to be disconnected or offline"
    $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
    Write-Output "LOG > $ADATE : Failed for $AWWWEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
    }
}
#    if (Test-Connection -BufferSize 2 -Count 1 -Quiet $GGLE) {
#        Write-Host -ForegroundColor Green "Reachable   | OK | $GGLE appear to be connected or online"
#    } else {
#        Write-Host -ForegroundColor Red "Unreachable | KO | $GGLE appear to be disconnected or offline"
#    }
#    pause
pause
}
if ($ACHOICE -eq "L") {
    $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
    Write-Output "LOG > $ADATE : Loopback Check started" >> $env:USERPROFILE\.netodiag\$ANAME
    $ARANGE = Read-Host " 1. Range 50    2. Range 100     3. Range 250"
    if ($ARANGE -eq 1) {
        $ARANGE = 50
    } elseif ($ARANGE -eq 2) {
        $ARANGE = 100
    } else {
        $ARANGE = 250
    }
    Write-Host " Testing Network Adapter by ping to 127.0.0.* range 1 to $ARANGE"
    while ($ARANGEIP -ne $ARANGE) {
        $ARANGEIP = $ARANGEIP+1
        if (Test-Connection -BufferSize 2 -Count 1 -Quiet 127.0.0.$ARANGEIP) {
            Write-Host -ForegroundColor Green "Reachable   | OK | 127.0.0.$ARANGEIP appear to be connected or online"
            $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
            Write-Output "LOG > $ADATE : Failed for $AWWWEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
        } else {
            $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
            Write-Output "LOG > $ADATE : Failed for $AWWWEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
            Write-Host -ForegroundColor Red "Unreachable | KO | 127.0.0.$ARANGEIP appear to be disconnected or offline"
        }
    }
    pause
}
if ($ACHOICE -eq "D") {
    $DIP = Get-Content .\DIP.datapack
    Foreach ($DIPEXEC in $DIP)
    {
        #Ping Test. If PC is shut off, script will stop for the current PC in pipeline and move to the next one.
        if (Test-Connection -ComputerName $DIPEXEC -Count 1 -Quiet)
        {
            Write-Host -ForegroundColor Green "Reachable   | OK | $DIPEXEC appear to be connected or online"
            $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
            Write-Output "LOG > $ADATE : Success for $DIPEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
        } else {
            Write-Host -ForegroundColor Red "Unreachable | KO | $DIPEXEC appear to be disconnected or offline"
            $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
            Write-Output "LOG > $ADATE : Failed for $DIPEXEC" >> $env:USERPROFILE\.netodiag\$ANAME
        }
    } # bottom of foreach loop
    pause
}


# Ethernet Realtek PCIe GbE Family Controller                             Disconnected 94-DE-80-5B-F9-98
# Wi-Fi    Realtek RTL8188EU Wireless LAN 802.11n USB 2.0 Network Adapter Up           08-57-00-36-14-16
# Ethernet Realtek PCIe GbE Family Controller                             Disabled     94-DE-80-5B-F9-98
# Wi-Fi    Realtek RTL8188EU Wireless LAN 802.11n USB 2.0 Network Adapter Disabled     08-57-00-36-14-16
#  Enabled adapters low level  | DONE
# Ethernet Realtek PCIe GbE Family Controller                             Disconnected 94-DE-80-5B-F9-98
# Wi-Fi    Realtek RTL8188EU Wireless LAN 802.11n USB 2.0 Network Adapter Disconnected 08-57-00-36-14-16

if ($ACHOICE -eq 1) {
    if ($isAdmin -match "True") {
        Write-Host " Guide ------
Up           : Connected to Wi-Fi/Ethernet/LAN/WAN
Disabled     : LowLevel disabled (driver or hardware)
Disconnected : Disconnected from Wi-Fi/Ethernet/LAN/WAN but enabled.
        "
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
        Write-Output "LOG > $ADATE : Network Adapters restarting protocol engaged" >> $env:USERPROFILE\.netodiag\$ANAME
        Get-NetAdapter | Disable-NetAdapter -Confirm:$false
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
        Write-Output "LOG > $ADATE : Disabled NetAdapter based on config" >> $env:USERPROFILE\.netodiag\$ANAME
        Start-Sleep -Milliseconds 750
        Write-Host " Disabled adapters low level | DONE" -ForegroundColor Red
        Get-NetAdapter | Select-Object Name,InterfaceDescription,Status,MacAddress
        Get-NetAdapter | Enable-NetAdapter -Confirm:$false
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
        Write-Output "LOG > $ADATE : Enabled NetAdapter based on config" >> $env:USERPROFILE\.netodiag\$ANAME
        Start-Sleep -Milliseconds 750
        Write-Host " Enabled adapters low level  | DONE" -ForegroundColor Green
        Start-Sleep -Seconds 5
        Get-NetAdapter | Select-Object Name,InterfaceDescription,Status,MacAddress
        pause
    } else {
        Write-Host " You are not administrator. Re-run this program as admin to use this feature." -ForegroundColor Red
        Write-Output "LOG > $ADATE : Session rejected due to no admin rights [isAdmin set to $isAdmin]" >> $env:USERPROFILE\.netodiag\$ANAME
        pause
    }
}
if ($ACHOICE -eq 2) {
    if ($isAdmin -match "True") {
        $WINSERV = Get-Content .\WIN.SERVICE.datapack
        Foreach ($WINSERVEXEC in $WINSERV)
        {
            #Ping Test. If PC is shut off, script will stop for the current PC in pipeline and move to the next one.
            Write-Host -NoNewline " Restarting $WINSERVEXEC service ..."
            $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
            Write-Output "LOG > $ADATE : Service $WINSERVEXEC restarted without error(s)" >> $env:USERPROFILE\.netodiag\$ANAME
            Restart-Service $WINSERVEXEC
            Write-Host -ForegroundColor Green " OK - Restarted"
        } # bottom of foreach loop
        pause
    } else {
        Write-Host " You are not administrator. Re-run this program as admin to use this feature." -ForegroundColor Red
        $ADATE              = Get-Date -Format dd-MM-yy.HH-mm-ss        
        Write-Output "LOG > $ADATE : Session rejected due to no admin rights [isAdmin set to $isAdmin]" >> $env:USERPROFILE\.netodiag\$ANAME
        pause
    }
}






























# Restart the script eachtime an ops is done
#############################################
powershell -ExecutionPolicy bypass .\neto.ps1
#############################################
# This the EOL, but for reloading as a soft