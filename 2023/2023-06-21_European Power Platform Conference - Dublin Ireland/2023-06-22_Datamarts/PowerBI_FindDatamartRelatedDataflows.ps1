# Define workspace Id
$WorkspaceId = "9d371bd6-0afc-4837-a69c-ff7f26a3bb97"

# Sign in to Power BI Service
Connect-PowerBIServiceAccount 

# Get all dataflows in workspace
$ListDataflows = Invoke-PowerBIRestMethod -Method GET -Url https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/dataflows | ConvertFrom-Json
$ListDataflows.value

# Get dataflow source
$DataFlowObjectId = $ListDataflows.value.objectId
Invoke-PowerBIRestMethod -Method GET -Url https://api.powerbi.com/v1.0/myorg/groups/$WorkspaceId/dataflows/$DataFlowObjectId/datasources
