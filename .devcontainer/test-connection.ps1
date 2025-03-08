# PowerShell script to test Salesforce connection on Windows

Write-Host "Testing Salesforce connection..."

# Check if Salesforce CLI is installed
try {
    $sfVersion = sf --version
    Write-Host "Salesforce CLI is installed:"
    Write-Host $sfVersion
} catch {
    Write-Host "Salesforce CLI is not installed or not in PATH."
    Write-Host "Please install Salesforce CLI: https://developer.salesforce.com/tools/sfdxcli"
    exit 1
}

# Check if we have an authenticated org
try {
    $orgs = sf org list
    Write-Host $orgs
} catch {
    Write-Host ""
    Write-Host "No authenticated orgs found. Please authenticate with your Salesforce org:"
    Write-Host ""
    Write-Host "  sf org login web --set-default-dev-hub"
    Write-Host ""
    Write-Host "After authenticating, you can create a scratch org with:"
    Write-Host ""
    Write-Host "  sf org create scratch --definition-file config/project-scratch-def.json --set-default --alias my-scratch-org"
    Write-Host ""
    Write-Host "Then deploy your source to the scratch org with:"
    Write-Host ""
    Write-Host "  sf project deploy start"
    Write-Host ""
    exit 0
}

Write-Host ""
Write-Host "Checking org limits..."
sf limits:api:display

Write-Host ""
Write-Host "Checking org status..."
sf org display

Write-Host ""
Write-Host "Connection test complete!"