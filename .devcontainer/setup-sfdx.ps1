# PowerShell script to set up Salesforce CLI configuration on Windows

Write-Host "Setting up Salesforce CLI configuration..."

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

# Create .sfdx directory if it doesn't exist
$sfdxDir = "$env:USERPROFILE\.sfdx"
if (-not (Test-Path -Path $sfdxDir)) {
    New-Item -Path $sfdxDir -ItemType Directory | Out-Null
    Write-Host "Created .sfdx directory."
}

# Copy sfdx-config.json
Copy-Item -Path ".devcontainer/sfdx-config.json" -Destination "$sfdxDir\sfdx-config.json" -Force
Write-Host "Copied sfdx-config.json to $sfdxDir."

# Create .env file from sample if it doesn't exist
if (-not (Test-Path -Path ".env")) {
    if (Test-Path -Path ".devcontainer/.env.sample") {
        Copy-Item -Path ".devcontainer/.env.sample" -Destination ".env" -Force
        Write-Host "Created .env file from sample. Please update with your values."
    }
}

# Display Salesforce CLI configuration
Write-Host "Salesforce CLI configuration:"
sf config list

Write-Host "Salesforce CLI configuration setup complete!"