write-host "========================================`nMerchant e-Solutions Security Patch Tool`n========================================"

$patched = 1

if ((get-hotfix -Id "KB4012606" -ErrorAction SilentlyContinue) -or (get-hotfix -Id "KB4013198" -ErrorAction SilentlyContinue) -or (get-hotfix -Id "KB4012606" -ErrorAction SilentlyContinue) ){
$patched = 0
}
    
if ($patched -eq 0){
write-host "Your machine is patched.  No further action is needed`n"
}
else {
write-host "Your machine is NOT patched!  Please contact service desk to remediate!`n"
}


pause