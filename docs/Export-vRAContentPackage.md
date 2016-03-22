# Export-vRAContentPackage

## SYNOPSIS
    
Export a vRA Content Package

## SYNTAX


## DESCRIPTION

Export a vRA Content Package

## PARAMETERS


### Id

Specify the ID of a Content Package

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### Name

Specify the Name of a Content Package

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

### File

Specify the Filename to export to

* Required: true
* Position: named
* Default value: 
* Accept pipeline input: false

## INPUTS

System.String

## OUTPUTS

System.IO.FileInfo

## EXAMPLES
```
-------------------------- EXAMPLE 1 --------------------------

C:\PS>Export-vRAContentPackage -Id "b2d72c5d-775b-400c-8d79-b2483e321bae" -File C:\Packages\ContentPackage01.zip







-------------------------- EXAMPLE 2 --------------------------

C:\PS>Export-vRAContentPackage -Name "ContentPackage01" -File C:\Packages\ContentPackage01.zip
```
