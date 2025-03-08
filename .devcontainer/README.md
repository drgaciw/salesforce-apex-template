# Salesforce Apex Development Container

This directory contains the configuration files for the Salesforce Apex development container.

## Container Configuration Files

- **Dockerfile**: Defines the container image with Node.js, Salesforce CLI, and other dependencies
- **devcontainer.json**: VS Code configuration for the development container
- **apex-ruleset.xml**: PMD ruleset for Apex code quality analysis
- **vscode-launch.json**: Launch configuration for Apex debugging
- **sfdx-config.json**: Default Salesforce CLI configuration
- **.env.sample**: Template for environment variables

## Helper Scripts

### Bash Scripts (Linux/macOS)

- **post-create.sh**: Runs automatically when the container is created
  - Installs project dependencies
  - Sets up git configuration
  - Displays version information

- **setup-vscode.sh**: Configures VS Code settings
  - Creates .vscode directory
  - Copies launch configuration
  - Copies Apex PMD ruleset
  - Creates default settings.json

- **setup-sfdx.sh**: Sets up Salesforce CLI configuration
  - Creates .sfdx directory
  - Copies sfdx-config.json
  - Creates .env file from template
  - Loads environment variables

- **test-connection.sh**: Tests Salesforce connection
  - Checks for authenticated orgs
  - Provides authentication instructions if needed
  - Displays org limits and status

### PowerShell Scripts (Windows)

- **post-create.ps1**: Windows version of post-create.sh
- **setup-vscode.ps1**: Windows version of setup-vscode.sh
- **setup-sfdx.ps1**: Windows version of setup-sfdx.sh
- **test-connection.ps1**: Windows version of test-connection.sh

## Container Features

### Development Tools

- **Salesforce CLI**: Command-line interface for Salesforce development
- **Node.js 18**: JavaScript runtime for LWC development
- **Java 17**: Required for Apex development and debugging
- **Git**: Version control system
- **Maven**: Build automation tool for Java projects

### VS Code Extensions

- **Salesforce Extension Pack**: Suite of tools for Salesforce development
- **Apex PMD**: Static code analysis for Apex
- **Apex Log Analyzer**: Advanced log file analysis
- **Salesforce Documenter**: Documentation generation for Apex classes
- **ESLint**: JavaScript/TypeScript linting
- **Prettier**: Code formatting
- **Code Spell Checker**: Spell checking for code and comments
- **GitLens**: Enhanced Git capabilities
- **XML**: XML validation and formatting
- **GitHub Copilot**: AI code assistance
- **GitHub Pull Request**: GitHub PR integration

## Customization

### Adding Custom Tools

To add custom tools to the container, modify the Dockerfile:

```dockerfile
# Example: Add Python
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    python3 \
    python3-pip \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
```

### Adding VS Code Extensions

To add more VS Code extensions, modify the `extensions` array in devcontainer.json:

```json
"extensions": [
    "salesforce.salesforcedx-vscode",
    "your-extension-publisher.your-extension-id"
]
```

### Customizing Apex PMD Rules

To customize the Apex PMD ruleset, modify the apex-ruleset.xml file. You can:

- Add or remove rules
- Adjust rule properties and thresholds
- Create custom rule configurations

### Environment Variables

Create a `.env` file based on the `.env.sample` template to set environment variables for your project.