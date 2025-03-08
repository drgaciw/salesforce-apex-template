#!/bin/bash

# This script sets up VS Code configuration for Salesforce development

# Create .vscode directory if it doesn't exist
mkdir -p /workspace/.vscode

# Copy launch configuration
cp /workspace/.devcontainer/vscode-launch.json /workspace/.vscode/launch.json

# Copy Apex PMD ruleset
cp /workspace/.devcontainer/apex-ruleset.xml /workspace/.vscode/apex-ruleset.xml

# Create settings.json if it doesn't exist
if [ ! -f /workspace/.vscode/settings.json ]; then
  cat > /workspace/.vscode/settings.json << EOF
{
  "salesforcedx-vscode-core.push-or-deploy-on-save.enabled": false,
  "salesforcedx-vscode-core.retrieve-test-code-coverage": true,
  "salesforcedx-vscode-apex.java.home": "/usr/lib/jvm/default-java",
  "editor.formatOnSave": true,
  "prettier.singleQuote": true,
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "html"
  ]
}
EOF
fi

echo "VS Code configuration setup complete!"