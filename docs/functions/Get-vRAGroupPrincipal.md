# Get-vRAGroupPrincipal

## SYNOPSIS
Finds groups.

## SYNTAX

### Standard (Default)
```
Get-vRAGroupPrincipal [-Tenant <String>] [-Limit <String>]
```

### ById
```
Get-vRAGroupPrincipal -Id <String[]> [-Tenant <String>]
```

## DESCRIPTION
Finds groups in one of the identity providers configured for the tenant.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-vRAGroupPrincipal
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-vRAGroupPrincipal -Id group@vsphere.local
```

### -------------------------- EXAMPLE 3 --------------------------
```
Get-vRAGroupPrincipal -PrincipalId group@vsphere.local
```

## PARAMETERS

### -Id
The Id of the group

```yaml
Type: String[]
Parameter Sets: ById
Aliases: PrincipalId

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tenant
The tenant of the group

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: $Global:vRAConnection.Tenant
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The number of entries returned per page from the API.
This has a default value of 100.

```yaml
Type: String
Parameter Sets: Standard
Aliases: 

Required: False
Position: Named
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### System.String

## OUTPUTS

### System.Management.Automation.PSObject.

## NOTES

## RELATED LINKS

