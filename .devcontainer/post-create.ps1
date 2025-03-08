# PowerShell script to set up Salesforce development environment on Windows

Write-Host "Setting up Salesforce development environment..."

# Install project dependencies
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install npm dependencies."
    exit 1
}

# Set up git configuration
git config --global pull.rebase false

# Display Salesforce CLI version
Write-Host "Salesforce CLI version:"
sf --version

# Display Node.js version
Write-Host "Node.js version:"
node --version

# Display npm version
Write-Host "npm version:"
npm --version

# Run the VS Code setup script
Write-Host "Setting up VS Code configuration..."
& "$PSScriptRoot\setup-vscode.ps1"

# Run the SFDX setup script
Write-Host "Setting up Salesforce CLI configuration..."
& "$PSScriptRoot\setup-sfdx.ps1"

Write-Host "Development environment setup complete!"