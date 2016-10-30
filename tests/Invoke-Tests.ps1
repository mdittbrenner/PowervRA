<#

    This script is intended to use used as a wrapper for Pester.
    It allows a sinlge entry point for multiple different testing scenarios.

#>

Param (

    # Parameter help description
    [Parameter(Mandatory=$true)]
    [ValidateSet("6.2.4", "7.0", "7.1", "7.2")]
    [String]$Version

)

# --- Get the current location
$Location = (Get-Location -Verbose:$VerbosePreference).Path
Write-Verbose -Message "Current location: $($Location)"

$VariablePath = "$($Location)\Variables\v$($Version).json"
Write-Verbose -Message "Variable path: $($VariablePath)"

try {

    # --- Invoke Pester
    if (Test-Path -Path $VariablePath -Verbose:$VerbosePreference) {

        $Global:vRATestVariablePath = $VariablePath

        if (!(Test-Path -Path "$($Location)\Logs")) {

            Write-Verbose -Message "Creating Pester output directory at $($Location)\Logs"
            New-Item -Path -Verbose | Out-Null

        }

        $OutputFile = "$($Location)\Logs\PesterResults-NUnitXml-$(Get-Date -Format ddMMyyyy.hhmmss).xml"

        Write-Verbose -Message "Invoking Pester using output file $($OutputFile)"

        $ExitCode = Invoke-Pester -EnableExit -OutputFormat NUnitXml -OutputFile $OutputFile -Verbose:$VerbosePreference

        Write-Verbose -Message "Completed with ExitCode $($ExitCode)"

    } else {

        Write-Error -Message "Could not find variable set for version $($Version) at path $($VariablePath)"

    }

} 
catch [System.Exception]{

    throw $_.ErrorMessage

}
finally {

    # --- Ensure that the vRATestVariablePath global variable is cleared regardless of the outcome
    Write-Verbose -Message "Cleaning up vRATestVariablePath global variable"
    Remove-Variable -Scope GLOBAL -Name vRATestVariablePath -Force -ErrorAction SilentlyContinue -Verbose:$VerbosePreference

}