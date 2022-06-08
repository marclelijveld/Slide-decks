# Run parameters, please specify below parameters
$WorkspaceName = "SQL Bits" # Here specify the workspace name, not the id! Please replace spaces for %20. This is used to concatenate the XMLA endpoint later. 
$DatasetName = "Manual setup partitions" # DatasetName to find the dataset and later to be used in backup filename

# Base variables
$PbiBaseConnection = "powerbi://api.powerbi.com/v1.0/myorg/"
$XmlaEndpoint = $PbiBaseConnection + $WorkspaceName

$NamePrefix = Get-Date -Format "yyyyMMdd-HHmmss" #Gets Date and Time on which the backup is performed as prefix to list backups easily in order
$BackupFileName = $NamePrefix + "_" + $DatasetName

# TMSL Script for backup
$TmslScript = 
@"
{
  "backup": {
    "database": "$DatasetName",
    "file": "$BackupFileName.abf",
    "allowOverwrite": false,
    "applyCompression": true
  }
}
"@

# Execute backup operation
Try {
    Invoke-ASCmd -Query $TmslScript -Server: $XmlaEndpoint
}
Catch{
    # Write message if error
    Write-Host "An error occured" -ForegroundColor Red
}