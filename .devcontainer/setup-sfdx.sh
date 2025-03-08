#!/bin/bash

# This script sets up Salesforce CLI configuration

echo "Setting up Salesforce CLI configuration..."

# Create .sfdx directory if it doesn't exist
mkdir -p /home/node/.sfdx

# Copy sfdx-config.json
cp /workspace/.devcontainer/sfdx-config.json /home/node/.sfdx/sfdx-config.json

# Create .env file from sample if it doesn't exist
if [ ! -f /workspace/.env ]; then
  if [ -f /workspace/.devcontainer/.env.sample ]; then
    cp /workspace/.devcontainer/.env.sample /workspace/.env
    echo "Created .env file from sample. Please update with your values."
  fi
fi

# Load environment variables if .env exists
if [ -f /workspace/.env ]; then
  set -a
  source /workspace/.env
  set +a
  echo "Loaded environment variables from .env file."
fi

# Display Salesforce CLI configuration
echo "Salesforce CLI configuration:"
sf config list

echo "Salesforce CLI configuration setup complete!"