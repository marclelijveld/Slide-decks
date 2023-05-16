# Documentation page: https://docs.microsoft.com/en-us/power-bi/connect-data/asynchronous-refresh?WT.mc_id=DP-MVP-5003435&

# Sign in to Power BI
Connect-PowerBIServiceAccount

$WorkspaceId = "998476b3-c3ff-48c2-8c4c-f0bfbeb40b8f"
$DatasetId = "10a80cea-fd42-472b-aa04-20f746aaeac3" 

# Define body to pass in API call
$body = @"
 {
    "type": "Full",
    "commitMode": "transactional",
    "maxParallelism": 2,
    "retryCount": 2,
    "objects": [
        {
            "table": "Orders"
        }
    ]
}
"@

# Trigger refresh for specified table
Invoke-PowerBIRestMethod -Method POST -Url https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/datasets/$DatasetId/refreshes -Body $body

# Get Refresh history
$RefreshResults = Invoke-PowerBIRestMethod -Method GET -Url https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/datasets/$DatasetId/refreshes
$JsonObject = $RefreshResults | ConvertFrom-Json

# Get latest request id for refreshes
$LatestRequestId = $JsonObject.value.requestId | Select-Object -Index 0

# Get refresh status for latest request
Invoke-PowerBIRestMethod -Method GET -Url https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/datasets/$DatasetId/refreshes/$LatestRequestId 
