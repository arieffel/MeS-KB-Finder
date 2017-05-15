cls
$username = $env:USERNAME
$computername = $env:COMPUTERNAME
$patched = 1

write-host "============================================`n"
write-host "  Merchant e-Solutions Security Patch Tool`n"
write-host "============================================`n"

if ((get-hotfix -Id "KB4012606" -ErrorAction SilentlyContinue) -or (get-hotfix -Id "KB4013198" -ErrorAction SilentlyContinue) -or (get-hotfix -Id "KB4013429" -ErrorAction SilentlyContinue) ){
$patched = 0
}
    
if ($patched -eq 0){
write-host ("Your machine is patched.  No further action is needed`n") -ForegroundColor Green
}
else {
    write-host ("YOUR MACHINE IS NOT PATCHED!`n") -ForegroundColor Red
    write-host "Please open a ticket with Service Desk and include the following information:`n"
    write-host "Computer Name: $computername"
    write-host "User Name: $username`n`n"
    write-host "DO NOT ATTEMPT TO CONNECT TO CORPORATE VPN UNTIL YOUR MACHINE HAS BEEN SUCCESSFULLY REMEDIATED!`n`n"
}


pause
