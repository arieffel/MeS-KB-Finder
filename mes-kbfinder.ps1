cls
$username = $env:USERNAME
$computername = $env:COMPUTERNAME
$WindowsVersion = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId
$patched = 1
$hotfixes = @(‘KB4012212’, ‘KB4012213’, ‘KB4012214’, ‘KB4012215’, ‘KB4012216’, ‘KB4012217’, ‘KB4012598’, ‘KB4013429’, ‘KB4015217’, ‘KB4015438’, ‘KB4015549’, ‘KB4015550’, ‘KB4015551’, ‘KB4015552’, ‘KB4015553’, ‘KB4016635’, ‘KB4019215’, ‘KB4019216’, ‘KB4019264’, ‘KB4019472’)

write-host "================================================`n"
write-host "     Merchant e-Solutions Hotfix Check Tool      "
write-host "           Created by: Alex Rieffel`n              "
write-host "    Email: arieffel@merchante-solutions.com      `n"
write-host "================================================`n"

$hotfix = Get-HotFix | Where-Object {$hotfixes -contains $_.HotfixID} | Select-Object -property “HotfixID”
if (Get-HotFix | Where-Object {$hotfixes -contains $_.HotfixID}) {
$ID = $hotfix.HotfixID
$patched = 0
}
    
if (($patched -eq 0) -or ($WindowsVersion = 1703)){
write-host "Your machine is patched.  No further action is needed`n" -ForegroundColor Green
    if ($patched -eq 0) {
    write-host "The script found the following hotfix: $ID" -ForegroundColor Green
    }
}
else {
    write-host ("YOUR MACHINE IS NOT PATCHED!`n") -ForegroundColor Red
    write-host "Please open a ticket with Service Desk and include the following information:`n"
    write-host "Computer Name: $computername"
    write-host "User Name: $username"
    write-host "Windows Version: $WindowsVersion`n`n"
    write-host "DO NOT ATTEMPT TO CONNECT TO CORPORATE VPN UNTIL YOUR MACHINE HAS BEEN SUCCESSFULLY REMEDIATED!`n`n"
}


pause
