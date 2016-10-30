Param (

    # Parameter help description
    [Parameter(Mandatory=$true)]
    [ValidateSet("6.2.4", "7.0", "7.1", "7.2")]
    [String]$Version

)

# --- Get the current location
$Location = (Get-Location -Verbose:$VerbosePreference).Path

$VariablePath = "$($Location)\Variables\v$($Version).json"

try {

    # --- Invoke Pester
    if (Test-Path -Path $VariablePath -Verbose:$VerbosePreference) {

        $Global:vRATestVariablePath = $VariablePath

        if (!(Test-Path -Path "$($Location)\Logs")) {

            New-Item -Path


        }

        $OutputFile = "$($Location)\Logs\PesterResults-NUnitXml-$(Get-Date -Format ddMMyyyy.hhmmss).xml"
        $ExitCode = Invoke-Pester -EnableExit -OutputFormat NUnitXml -OutputFile $OutputFile -Verbose:$VerbosePreference

        $ExitCode

    } else {

        Write-Error -Message "Could not find variable set for version $($Version) at path $($VariablePath)"

    }

} 
catch [System.Exception]{

    throw $_.ErrorMessage

}
finally {

    # --- Ensure that the vRATestVariablePath global variable is cleared regardless of the outcome 
    Remove-Variable -Scope GLOBAL -Name vRATestVariablePath -Force -ErrorAction SilentlyContinue -Verbose:$VerbosePreference

}

