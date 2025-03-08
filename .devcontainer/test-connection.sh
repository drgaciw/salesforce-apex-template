#!/bin/bash

# This script tests the Salesforce connection

echo "Testing Salesforce connection..."

# Check if we have an authenticated org
sf org list

# If no orgs are authenticated, provide instructions
if [ $? -ne 0 ]; then
  echo ""
  echo "No authenticated orgs found. Please authenticate with your Salesforce org:"
  echo ""
  echo "  sf org login web --set-default-dev-hub"
  echo ""
  echo "After authenticating, you can create a scratch org with:"
  echo ""
  echo "  sf org create scratch --definition-file config/project-scratch-def.json --set-default --alias my-scratch-org"
  echo ""
  echo "Then deploy your source to the scratch org with:"
  echo ""
  echo "  sf project deploy start"
  echo ""
else
  echo ""
  echo "Checking org limits..."
  sf limits:api:display
  
  echo ""
  echo "Checking org status..."
  sf org display
fi

echo ""
echo "Connection test complete!"