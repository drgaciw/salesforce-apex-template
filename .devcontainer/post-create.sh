#!/bin/bash

# This script runs after the container is created

echo "Setting up Salesforce development environment..."

# Install project dependencies
npm install

# Set up git configuration
git config --global pull.rebase false

# Display Salesforce CLI version
echo "Salesforce CLI version:"
sf --version

# Display Node.js version
echo "Node.js version:"
node --version

# Display npm version
echo "npm version:"
npm --version

echo "Development environment setup complete!"