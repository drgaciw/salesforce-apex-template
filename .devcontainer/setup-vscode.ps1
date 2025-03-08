# PowerShell script to set up VS Code configuration for Salesforce development on Windows

Write-Host "Setting up VS Code configuration..."

# Create .vscode directory if it doesn't exist
if (-not (Test-Path -Path ".vscode")) {
    New-Item -Path ".vscode" -ItemType Directory | Out-Null
    Write-Host "Created .vscode directory."
}

# Copy launch configuration
Copy-Item -Path ".devcontainer/vscode-launch.json" -Destination ".vscode/launch.json" -Force
Write-Host "Copied launch configuration."

# Copy Apex PMD ruleset
Copy-Item -Path ".devcontainer/apex-ruleset.xml" -Destination ".vscode/apex-ruleset.xml" -Force
Write-Host "Copied Apex PMD ruleset."

# Create settings.json if it doesn't exist
if (-not (Test-Path -Path ".vscode/settings.json")) {
    $settingsJson = @"
{
  "salesforcedx-vscode-core.push-or-deploy-on-save.enabled": false,
  "salesforcedx-vscode-core.retrieve-test-code-coverage": true,
  "editor.formatOnSave": true,
  "prettier.singleQuote": true,
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "html"
  ]
}
"@
    $settingsJson | Out-File -FilePath ".vscode/settings.json" -Encoding utf8
    Write-Host "Created settings.json file."
}

Write-Host "VS Code configuration setup complete!"