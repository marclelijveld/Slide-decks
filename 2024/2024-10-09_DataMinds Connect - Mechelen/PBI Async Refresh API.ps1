# Documentation page: https://docs.microsoft.com/en-us/power-bi/connect-data/asynchronous-refresh?WT.mc_id=DP-MVP-5003435&

# Sign in to Power BI
Disconnect-PowerBIServiceAccount
Connect-PowerBIServiceAccount

$WorkspaceId = "46de728f-d476-4276-aa0d-b9d6be7e9a76"
$DatasetId = "f2a9f6da-be59-4a4d-b0f5-876addbeda13" 

# Define body to pass in API call
$body = @"
 {
    "type": "Full",
    "commitMode": "transactional",
    "maxParallelism": 2,
    "retryCount": 2,
    "objects": [
        {
            "table": "FactInternetSales"
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
