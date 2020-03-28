

Write-Host "This tool is designed to import driver from a folder. Clic OK to continue !"
$CHECKING = Read-Host "Type 123 then enter or OK"
if ($CHECKING -eq 123) {
    Write-Host "At next window, type the name of the folder in the list"
    $FLIST = Get-ChildItem -Directory -Name
    $FOLDER = Read-Host "$FLIST"
    Get-ChildItem ".\$FOLDER" -Recurse -Filter "*.inf"
    $DriverImport = Get-ChildItem ".\$FOLDER"
    $i = 1
    $DriverImport = ForEach-Object { 
        Write-Progress -Activity "Counting WinSxS file $($_.name)" -Status "File $i of $($DriverImport.Count)" -PercentComplete (($i / $DriverImport.Count) * 100)  
        $i++
        PNPUtil.exe /add-driver $_.FullName /install 
        pause
    }
} else {
    Start-Process .\DriverImporter.exe
}