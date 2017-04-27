$PSM1 = New-Item -Path ".\PowervRA-build.psm1" -ItemType File -Force

$PSM1Header = @"
<#
     _____                             _____            
    |  __ \                           |  __ \     /\    
    | |__) |____      _____ _ ____   _| |__) |   /  \   
    |  ___/ _ \ \ /\ / / _ \ '__\ \ / /  _  /   / /\ \  
    | |  | (_) \ V  V /  __/ |   \ V /| | \ \  / ____ \ 
    |_|   \___/ \_/\_/ \___|_|    \_/ |_|  \_\/_/    \_\                                                    

#>

# --- Clean up vRAConnection variable on module remove
`$ExecutionContext.SessionState.Module.OnRemove = {

    Remove-Variable -Name vRAConnection -Force -ErrorAction SilentlyContinue

}

"@  

Set-Content -Path $PSM1.FullName -Value $PSM1Header -Encoding UTF8

# --- Process Functions
$Functions = Get-ChildItem -Path .\PowervRA\Functions -File -Recurse
Write-Output "Processing function:"
foreach ($Function in $Functions) {

    Write-Output "  - $($Function.BaseName)"
    $Content = Get-Content -Path $Function.FullName -Raw
    $Definition = @"
<#
    - Function: $($Function.BaseName)
#>

$($Content)

"@

    Add-Content -Path $PSM1.FullName -Value $Definition -Encoding UTF8
}